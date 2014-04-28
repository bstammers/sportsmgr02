class Competition < ActiveRecord::Base
  validates :comp_name, presence: true
  validates :comp_name, uniqueness: {case_sensitive: false}
end
