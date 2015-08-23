class WikiPolicy < ApplicationPolicy
	def index?
		true 
	end

	def show?
    (user.present? && ((user.role == 'premium') || (user.role == 'admin'))) || record.private != true
		#record.private? && (user_role == 'premium')
		#(user.present? && user.role == 'premium') || record.private?
    #(user.role == 'premium') || record.private?
    #record.private != true || (user.present? && ((user.role == 'admin') || record.user == user || record.users.include?(user)))  
  end

  def update?
    show?
  end

  def create?
  	user.present?
  end

  def new?
  	create?
  end

  class Scope
     attr_reader :user, :scope
 
     def initialize(user, scope)
       @user = user
       @scope = scope
     end
  end

end