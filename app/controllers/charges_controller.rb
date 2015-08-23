class ChargesController < ApplicationController

  before_action :authenticate_user!

  def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Membership - #{current_user.name}",
     amount: amount_for_upgrade
   }
  end

	def create
 
   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: amount_for_upgrade,
     description: "Premium Membership #{current_user.email}",
     currency: 'usd'
   )
 
   current_user.update_attribute(:role, 'premium')
   current_user.save

   flash[:notice] = "You have upgraded your account!, #{current_user.email}! Thank You!"
   redirect_to wikis_path(current_user) # or wherever
 
 # Stripe will send back CardErrors, with friendly messages
 # when something goes wrong.
 # This `rescue block` catches and displays those errors.
  rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_charges_path
  end

  private

  def amount_for_upgrade
    15_00
  end


end
