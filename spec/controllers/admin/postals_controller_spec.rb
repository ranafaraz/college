require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe Admin::PostalsController, type: :controller do

  let(:user) { Signup::User.create(firstname: 'Rails', lastname: 'Admin', email:'a@s.com',password: 'secret', admin: true) }

  before do
    log_in_as user
  end

  # This should return the minimal set of attributes required to create a valid
  # Admin::Postal. As you add validations to Admin::Postal, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do{
    name: "MyString",
        details: "MyString",
        type: FactoryGirl.create(:admin_postal_type,:icon=>FactoryGirl.create(:admin_icon))
  }end

  let(:invalid_attributes) do{
      name: "",
      details: "",
      type: ""
  }end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Admin::PostalsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all admin_postals as @admin_postals" do
      postal = Admin::Postal.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:admin_postals)).to eq([postal])
    end
  end

  describe "GET #show" do
    it "assigns the requested admin_postal as @admin_postal" do
      postal = Admin::Postal.create! valid_attributes
      get :show, params: {id: postal.to_param}, session: valid_session
      expect(assigns(:admin_postal)).to eq(postal)
    end
  end

  describe "GET #new" do
    it "assigns a new admin_postal as @admin_postal" do
      get :new, params: {}, session: valid_session
      expect(assigns(:admin_postal)).to be_a_new(Admin::Postal)
    end
  end

  describe "GET #edit" do
    it "assigns the requested admin_postal as @admin_postal" do
      postal = Admin::Postal.create! valid_attributes
      get :edit, params: {id: postal.to_param}, session: valid_session
      expect(assigns(:admin_postal)).to eq(postal)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Admin::Postal" do
        expect {
          Admin::Postal.create!(valid_attributes)
              .to change(Admin::Postal, :count).by(1)}
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved admin_postal as @admin_postal" do
        post :create, params: {admin_postal: invalid_attributes}, session: valid_session
        expect(assigns(:admin_postal)).to be_a_new(Admin::Postal)
      end

      it "re-renders the 'new' template" do
        post :create, params: {admin_postal: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do{
        name: "MyString1",
            details: "MyString1",
            type: FactoryGirl.create(:admin_postal_type,:name=>"newp",icon: FactoryGirl.create(:admin_icon,:icon=>"ic",:name=>"name"))
      }end

      it "updates the requested admin_postal" do
        postal = Admin::Postal.create! valid_attributes
        put :update, params: {id: postal.to_param, admin_postal: new_attributes}, session: valid_session
        postal.reload
      end

      it "assigns the requested admin_postal as @admin_postal" do
        postal = Admin::Postal.create! valid_attributes
        put :update, params: {id: postal.to_param, admin_postal: valid_attributes}, session: valid_session
        expect(assigns(:admin_postal)).to eq(postal)
      end

      it "redirects to the admin_postal" do
        postal = Admin::Postal.create! valid_attributes
        put :update, params: {id: postal.to_param, admin_postal: valid_attributes}, session: valid_session
        expect(response).to redirect_to(postal)
      end
    end

    context "with invalid params" do
      it "assigns the admin_postal as @admin_postal" do
        postal = Admin::Postal.create! valid_attributes
        put :update, params: {id: postal.to_param, admin_postal: invalid_attributes}, session: valid_session
        expect(assigns(:admin_postal)).to eq(postal)
      end

      it "re-renders the 'edit' template" do
        postal = Admin::Postal.create! valid_attributes
        put :update, params: {id: postal.to_param, admin_postal: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin_postal" do
      postal = Admin::Postal.create! valid_attributes
      expect {
        delete :destroy, params: {id: postal.to_param}, session: valid_session
      }.to change(Admin::Postal, :count).by(-1)
    end

    it "redirects to the admin_postals list" do
      postal = Admin::Postal.create! valid_attributes
      delete :destroy, params: {id: postal.to_param}, session: valid_session
      expect(response).to redirect_to(admin_postals_url)
    end
  end

end
