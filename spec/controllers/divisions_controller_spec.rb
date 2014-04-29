require 'spec_helper'

describe DivisionsController do
  before do
    valid_user_sign_in
  end
  # This should return the minimal set of attributes required to create a valid
  # Division. As you add validations to Division, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "division_name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DivisionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  let(:div01) {FactoryGirl.create(:division)}

  describe "GET index" do
    it "assigns all divisions as @divisions" do
      get :index
      assigns(:divisions).should eq([div01])
    end
  end

  describe "GET show" do
    it "assigns the requested division as @division" do
      get :show, id: div01
      assigns(:division).should eq(div01)
    end
  end

  describe "GET new" do
    it "assigns a new division as @division" do
      get :new
      assigns(:division).should be_a_new(Division)
    end
  end

  describe "GET edit" do
    it "assigns the requested division as @division" do
      get :edit, id: div01
      assigns(:division).should eq(div01)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Division" do
        expect {
          post :create, division: FactoryGirl.attributes_for(:division)}.to change(Division, :count).by(1)
      end

      it "assigns a newly created division as @division" do
        post :create, division: FactoryGirl.attributes_for(:division)
        assigns(:division).should be_a(Division)
        assigns(:division).should be_persisted
      end

      it "redirects to the created division" do
        post :create, division: FactoryGirl.attributes_for(:division)
        response.should redirect_to(Division.last)
      end
    end

    describe "with invalid params" do
      it "does not save the new competition" do
        expect {post :create, division: FactoryGirl.attributes_for(:invalid_division)}.to_not change(Division, :count)
      end

      it "re-renders the 'new' template" do
        post :create, division: FactoryGirl.attributes_for(:invalid_division)
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
      before :each do
        @div = FactoryGirl.create(:division)
      end
    describe "with valid params" do
      it "updates the requested division" do
        put :update, id: @div, division: FactoryGirl.attributes_for(:division, division_name: "Sample Div")
        @comp.reload
        @comp.comp_name.should eq("Sample Div")
      end

      it "assigns the requested division as @division" do
        put :update, id: @div, division: FactoryGirl.attributes_for(:division)
        assigns(:division).should eq(@div)
      end

      it "redirects to the division" do
        put :update, id: @div, division: FactoryGirl.attributes_for(:division)
        response.should redirect_to(@div)
      end
    end

    describe "with invalid params" do
       it "does not update the requested division" do
        put :update, id: @div, division: FactoryGirl.attributes_for(:invalid_division)
        @div.reload
        @div.division_name.should_not eq("Sample Div")
      end
      it "re-renders the 'edit' template" do
        put :update, id: @div, division: FactoryGirl.attributes_for(:invalid_division)
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested division" do
      expect {
        delete :destroy, id: div01}.to change(Division, :count).by(-1)
    end

    it "redirects to the divisions list" do
      delete :destroy, id: div01
      response.should redirect_to(divisions_url)
    end
  end

end
