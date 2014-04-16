require 'spec_helper.rb'

describe 'login page' do
  it 'displays login details' do
    visit '/'  #set route after devise added
    expect(page).to have_content('Sign in')
  end
  it 'logs a valid user in' do
    #AFTER DEVISE ADDED - re-direct to user page
  end
  it 'does not log an invalid user in' do
    #AFTER DEVISE ADDED - re-direct to sign up page
  end
end
