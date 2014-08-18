require 'rails_helper'

RSpec.describe "guardians/edit", :type => :view do
  before(:each) do
    @guardian = assign(:guardian, Guardian.create!(
      :username => "MyString",
      :password_digest => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit guardian form" do
    render

    assert_select "form[action=?][method=?]", guardian_path(@guardian), "post" do

      assert_select "input#guardian_username[name=?]", "guardian[username]"

      assert_select "input#guardian_password_digest[name=?]", "guardian[password_digest]"

      assert_select "input#guardian_first_name[name=?]", "guardian[first_name]"

      assert_select "input#guardian_last_name[name=?]", "guardian[last_name]"

      assert_select "input#guardian_email[name=?]", "guardian[email]"
    end
  end
end
