require 'spec_helper'

describe Division do
  #MANDATORY FIELDS
  it {should validate_presence_of(:division_name)}
  
  #UNIQUE FIELDS
  it {should validate_uniqueness_of(:division_name)}
end
