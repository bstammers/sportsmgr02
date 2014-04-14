class User < ActiveRecord::Base
  
  validates :first_name, :last_name, :username, :email, presence: true
  validates :username, :email, uniqueness: {case_sensitive: false}
end
