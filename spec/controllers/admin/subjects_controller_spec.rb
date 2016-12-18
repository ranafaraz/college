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

RSpec.describe Admin::SubjectsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Admin::Subject. As you add validations to Admin::Subject, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes)do{
      name:"MyString",
      course: FactoryGirl.create(:admin_course),
      semester: FactoryGirl.create(:admin_semester)
  }end

  let(:invalid_attributes)do{
      name:"",
      course: "",
      semester: ""
  }end
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Admin::SubjectsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all admin_subjects as @admin_subjects" do
      subject = Admin::Subject.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:admin_subjects)).to eq([subject])
    end
  end

  describe "GET #show" do
    it "assigns the requested admin_subject as @admin_subject" do
      subject = Admin::Subject.create! valid_attributes
      get :show, params: {id: subject.to_param}, session: valid_session
      expect(assigns(:admin_subject)).to eq(subject)
    end
  end

  describe "GET #new" do
    it "assigns a new admin_subject as @admin_subject" do
      get :new, params: {}, session: valid_session
      expect(assigns(:admin_subject)).to be_a_new(Admin::Subject)
    end
  end

  describe "GET #edit" do
    it "assigns the requested admin_subject as @admin_subject" do
      subject = Admin::Subject.create! valid_attributes
      get :edit, params: {id: subject.to_param}, session: valid_session
      expect(assigns(:admin_subject)).to eq(subject)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Admin::Subject" do
        expect {
          Admin::Subject.create!(valid_attributes)
        }.to change(Admin::Subject, :count).by(1)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved admin_subject as @admin_subject" do
        post :create, params: {admin_subject: invalid_attributes}, session: valid_session
        expect(assigns(:admin_subject)).to be_a_new(Admin::Subject)
      end

      it "re-renders the 'new' template" do
        post :create, params: {admin_subject: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do{
          name:"MyString1",
          course: FactoryGirl.create(:admin_course,:name=>"Name",:description=>"desc"),
          semester: FactoryGirl.create(:admin_semester,:name=>"az",:short_form=>"ist")
      }end

      it "updates the requested admin_subject" do
        subject = Admin::Subject.create! valid_attributes
        put :update, params: {id: subject.to_param, admin_subject: new_attributes}, session: valid_session
        subject.reload
      end

      it "assigns the requested admin_subject as @admin_subject" do
        subject = Admin::Subject.create! valid_attributes
        put :update, params: {id: subject.to_param, admin_subject: valid_attributes}, session: valid_session
        expect(assigns(:admin_subject)).to eq(subject)
      end

      it "redirects to the admin_subject" do
        subject = Admin::Subject.create! valid_attributes
        put :update, params: {id: subject.to_param, admin_subject: valid_attributes}, session: valid_session
        expect(response).to redirect_to(subject)
      end
    end

    context "with invalid params" do
      it "assigns the admin_subject as @admin_subject" do
        subject = Admin::Subject.create! valid_attributes
        put :update, params: {id: subject.to_param, admin_subject: invalid_attributes}, session: valid_session
        expect(assigns(:admin_subject)).to eq(subject)
      end

      it "re-renders the 'edit' template" do
        subject = Admin::Subject.create! valid_attributes
        put :update, params: {id: subject.to_param, admin_subject: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin_subject" do
      subject = Admin::Subject.create! valid_attributes
      expect {
        delete :destroy, params: {id: subject.to_param}, session: valid_session
      }.to change(Admin::Subject, :count).by(-1)
    end

    it "redirects to the admin_subjects list" do
      subject = Admin::Subject.create! valid_attributes
      delete :destroy, params: {id: subject.to_param}, session: valid_session
      expect(response).to redirect_to(admin_subjects_url)
    end
  end

end