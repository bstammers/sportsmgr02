require 'spec_helper'

describe User do
  
  #MANDATORY FIELDS
  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:last_name)}
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:email)}
  it 'should not have a blank password' do
    @user = User.new(FactoryGirl.attributes_for(:user))
    @user.password = nil
    @user.should_not be_valid
  end
  it 'should not have a blank password confirmation' do
    @user = User.new(FactoryGirl.attributes_for(:user))
    @user.password_confirmation = nil
    @user.should_not be_valid
  end
  it 'should have password match password confirmation' do
    @user = User.new(FactoryGirl.attributes_for(:user))
    @user.password_confirmation = 'different'
    @user.should_not be_valid
  end
  #it {should validate_presence_of(:password)}
  #it {should validate_presence_of(:password_confirmation)}

  #UNIQUE FIELDS
  it {should validate_uniqueness_of(:username)}
  it {should validate_uniqueness_of(:email)}

end
