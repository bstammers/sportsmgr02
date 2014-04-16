require 'spec_helper.rb'

describe 'user signs up' do
  before do
    @user = FactoryGirl.create(:user, first_name: "Tom", last_name: "Brown", username: "tbrown", email: "tbrown@test.com", password: "password", password_confirmation: "password")
  end
  
  it 'signs up with valid details' do
      visit new_user_registration_path
      fill_in 'First name', with: @user.first_name
      fill_in 'Last name', with: @user.last_name
      fill_in 'Username', with: @user.username
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Confirmation', with: @user.password_confirmation
      click_button 'Sign up'
#    sign_up_with("John", "Black", "jblack", "jblack@test.com", "password")
    page.should have_content('Sign out') 
  end
  it 'signs up with invalid user name' do
      visit new_user_registration_path
      fill_in 'First name', with: @user.first_name
      fill_in 'Last name', with: @user.last_name
      fill_in 'Username', with: nil
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Confirmation', with: @user.password_confirmation
      click_button 'Sign up'
    page.should have_content('Sign in') 
  end
  it 'signs up with duplicate user name' do
      visit new_user_registration_path
      fill_in 'First name', with: @user.first_name
      fill_in 'Last name', with: @user.last_name
      fill_in 'Username', with: nil
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Confirmation', with: @user.password_confirmation
      click_button 'Sign up'
    page.should have_content('Sign in') 
  end
  it 'signs up with blank password' do
      visit new_user_registration_path
      fill_in 'First name', with: @user.first_name
      fill_in 'Last name', with: @user.last_name
      fill_in 'Username', with: @user.username
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: nil
      fill_in 'Confirmation', with: @user.password_confirmation
      click_button 'Sign up'
    page.should have_content('Sign in') 
  end
  
end
describe 'login page' do
  it 'displays login details' do
    visit '/'  #set route after devise added
    expect(page).to have_content('Sign in')
  end
  
  context 'valid user login' do
    it 'displays the admin page for an admin user' do
      
    end
    it 'displays the user dashboard for a non-admin user' do
      
    end
  end
  it 'does not log an invalid user in' do
    #AFTER DEVISE ADDED - re-direct to sign up page
  end
  
end
