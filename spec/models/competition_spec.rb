require 'spec_helper'

describe Competition do
  
  #MANDATORY FIELDS
  it {should validate_presence_of(:comp_name)}
  
  #UNIQUE FIELDS
  it {should validate_uniqueness_of(:comp_name)}
  
end
