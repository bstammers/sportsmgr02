require 'spec_helper'

describe "Competitions" do
  before do
    valid_user_sign_in
    @comp = FactoryGirl.build(:competition, comp_name: "Sample Comp", points_flag: false, sets_flag: false, mvp_flag: false)
  end
  it "should display competition index" do
    visit competitions_path
    page.should have_content "New Competition"
  end
  it "should open new competition form" do
    visit competitions_path
    click_link "New Competition"
    page.should have_content "New competition"    
  end
  it "creates new competition with valid details" do
      visit new_competition_path
      fill_in 'Competition Name', with: @comp.comp_name
      #fill_in 'competition_points_flag', with: @comp.points_flag
      #fill_in 'Sets flag', with: @comp.sets_flag
      #fill_in 'Mvp flag', with: @comp.mvp_flag
      click_button "Create Competition"
      page.should have_content "Competition was successfully created."
  end
  it "creates new competition with invalid details" do
      visit new_competition_path
      fill_in 'Competition Name', with: nil
      #fill_in 'points_flag', with: @comp.points_flag
      #fill_in 'Sets flag', with: @comp.sets_flag
      #fill_in 'Mvp flag', with: @comp.mvp_flag
      click_button "Create Competition"
      page.should have_content "New competition"
  end
  it "displays competition edit form" do
    #visit competitions_path
    #click_link 'Edit'
    visit edit_competition_path(@comp)
    page.should have_content "Editing competition"   
  end
  it "updates competition with valid details" do
    visit edit_competition_path(@comp)
    fill_in 'Competition Name', with: "Third comp"
    click_button "Update Competition"
    page.should have_content "Competition was successfully updated."
  end
  it "updates competition with invalid details" do
    visit edit_competition_path(@comp)
    fill_in 'Competition Name', with: nil
    click_button "Update Competition"
    page.should have_content "Editing competition"
  end
  
end
