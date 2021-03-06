require 'spec_helper'

describe CompetitionsController do

  before do
    valid_user_sign_in
  end
  # This should return the minimal set of attributes required to create a valid
  # Competition. As you add validations to Competition, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "comp_name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CompetitionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  let(:comp01) {FactoryGirl.create(:competition)}

  describe "GET index" do
    
    it "assigns all competitions as @competitions" do
      #competition = Competition.create! valid_attributes
      get :index
      assigns(:competitions).should eq(comp01)
    end
  end

  describe "GET show" do
    it "assigns the requested competition as @competition" do
      #competition = Competition.create! valid_attributes
      get :show, id: comp01
      assigns(:competition).should eq(comp01)
    end
  end

  describe "GET new" do
    it "assigns a new competition as @competition" do
      get :new
      assigns(:competition).should be_a_new(Competition)
    end
  end

  describe "GET edit" do
    it "assigns the requested competition as @competition" do
      #competition = Competition.create! valid_attributes
      get :edit, id: comp01
      assigns(:competition).should eq(comp01)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Competition" do
        expect {
          post :create, competition: FactoryGirl.attributes_for(:competition)}.to change(Competition, :count).by(1)
      end

      it "assigns a newly created competition as @competition" do
        post :create, competition: FactoryGirl.attributes_for(:competition)
        assigns(:competition).should be_a(Competition)
        assigns(:competition).should be_persisted
      end

      it "redirects to the created competition" do
        post :create, competition: FactoryGirl.attributes_for(:competition)
        response.should redirect_to(Competition.last)
      end
    end

    describe "with invalid params" do
      it "does not save the new competition" do
        # Trigger the behavior that occurs when invalid params are submitted
        #Competition.any_instance.stub(:save).and_return(false)
        expect {post :create, competition: FactoryGirl.attributes_for(:invalid_competition)}.to_not change(Competition, :count)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        #Competition.any_instance.stub(:save).and_return(false)
        post :create, competition: FactoryGirl.attributes_for(:invalid_competition)
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before :each do
        @comp = FactoryGirl.create(:competition)
      end
      it "updates the requested competition" do
        #competition = Competition.create! valid_attributes
        # Assuming there are no other competitions in the database, this
        # specifies that the Competition created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        #Competition.any_instance.should_receive(:update).with({ "comp_name" => "MyString" })
        put :update, id: @comp, competition: FactoryGirl.attributes_for(:competition, comp_name: "Second Comp")
        @comp.reload
        @comp.comp_name.should eq("Second Comp")
      end

      it "assigns the requested competition as @competition" do
        #competition = Competition.create! valid_attributes
        put :update, id: @comp, competition: FactoryGirl.attributes_for(:competition)
        assigns(:competition).should eq(@comp)
      end

      it "redirects to the competition" do
        #competition = Competition.create! valid_attributes
        put :update, id: @comp, competition: FactoryGirl.attributes_for(:competition)
        response.should redirect_to(@comp)
      end
    end

    describe "with invalid params" do
#      it "assigns the competition as @competition" do
        #competition = Competition.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
#        Competition.any_instance.stub(:save).and_return(false)
#        put :update, {:id => competition.to_param, :competition => { "comp_name" => "invalid value" }}, valid_session
#        assigns(:competition).should eq(competition)
#      end

       it "does not update the requested competition" do
        #competition = Competition.create! valid_attributes
        # Assuming there are no other competitions in the database, this
        # specifies that the Competition created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        #Competition.any_instance.should_receive(:update).with({ "comp_name" => "MyString" })
        put :update, id: @comp, competition: FactoryGirl.attributes_for(:invalid_competition)
        @comp.reload
        @comp.comp_name.should_not eq("Second Comp")
      end

     it "re-renders the 'edit' template" do
        #competition = Competition.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        #Competition.any_instance.stub(:save).and_return(false)
        put :update, id: @comp, competition: FactoryGirl.attributes_for(:invalid_competition)
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested competition" do
      #competition = Competition.create! valid_attributes
      expect {
        delete :destroy, id: comp01}.to change(Competition, :count).by(-1)
    end

    it "redirects to the competitions list" do
      #competition = Competition.create! valid_attributes
      delete :destroy, id: comp01
      response.should redirect_to(competitions_url)
    end
  end

end
