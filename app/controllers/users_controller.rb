class UsersController < ApplicationController
 def downgrade
     current_user.update_attribute(:role, 'standard')
     current_user.save
     flash[:notice] = "You now have a standard membership." 
     current_user.wikis.each do |wiki|
     wiki.update_attribute(:private, false)
  end
    redirect_to wikis_path 
end