require 'rails_helper'

RSpec.describe "admin/contacts/new", type: :view do
  let(:user) { Signup::User.create(firstname: 'Rails', lastname: 'Admin', email: 'a@s.com', password: 'secret', admin: true) }
  before do
    assign(:current_user, user)
  end

  before(:each) do
    assign(:admin_contact, Admin::Contact.new(
      :name => "MyString",
      :email => "MyString",
      :phone => 1,
      :message => "MyText"
    ))
  end

  it "renders new admin_contact form" do
    render

    assert_select "form[action=?][method=?]", admin_contacts_path, "post" do

      assert_select "input#admin_contact_name[name=?]", "admin_contact[name]"

      assert_select "input#admin_contact_email[name=?]", "admin_contact[email]"

      assert_select "input#admin_contact_phone[name=?]", "admin_contact[phone]"

      assert_select "textarea#admin_contact_message[name=?]", "admin_contact[message]"
    end
  end
end
