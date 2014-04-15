class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  validates :first_name, :last_name, :username, :email, presence: true
  validates :username, :email, uniqueness: {case_sensitive: false}
end
