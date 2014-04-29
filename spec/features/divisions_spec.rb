require 'spec_helper'

describe "Divisions" do
  before do
    valid_user_sign_in
    @div = FactoryGirl.build(:division, division_name: "Sample Div")
  end
  it "should display division index" do
    visit divisions_path
    page.should have_content "New Division"
  end
  it "should open new division form" do
    visit divisions_path
    click_link "New Division"
    page.should have_content "New division"    
  end
  it "creates new division with valid details" do
      visit new_division_path
      fill_in 'Division Name', with: @div.division_name
      click_button "Create Division"
      page.should have_content "Division was successfully created."
  end
  it "creates new division with invalid details" do
      visit new_division_path
      fill_in 'Division Name', with: nil
      click_button "Create Division"
      page.should have_content "New division"
  end
  it "displays division edit form" do
    #visit competitions_path
    #click_link 'Edit'
    visit edit_division_path(@div)
    page.should have_content "Editing division"   
  end
  it "updates division with valid details" do
    visit edit_division_path(@div)
    fill_in 'Division Name', with: "Third div"
    click_button "Update Division"
    page.should have_content "Division was successfully updated."
  end
  it "updates division with invalid details" do
    visit edit_division_path(@div)
    fill_in 'Division Name', with: nil
    click_button "Update Division"
    page.should have_content "Editing division"
  end
end
