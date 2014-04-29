class Division < ActiveRecord::Base
  validates :division_name, presence: true
  validates :division_name, uniqueness: {case_sensitive: false}
end
