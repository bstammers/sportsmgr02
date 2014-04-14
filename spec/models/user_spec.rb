require 'spec_helper'

describe User do
  
  #MANDATORY FIELDS
  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:last_name)}
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:email)}

  #UNIQUE FIELDS
  it {should validate_uniqueness_of(:username)}
  it {should validate_uniqueness_of(:email)}

end
