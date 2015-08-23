class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

before_create :set_role
has_many :wikis

def set_role
 	self.role ||= 'standard'
 end

def admin?
  role == 'admin'
end
 
def premium?
	role == 'premium'
end

def standard?
	role == 'standard'
end

end
