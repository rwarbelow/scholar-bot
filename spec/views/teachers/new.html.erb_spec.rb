require 'rails_helper'

RSpec.describe "teachers/new", :type => :view do
  before(:each) do
    assign(:teacher, Teacher.new(
      :username => "MyString",
      :password_digest => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :title => "MyString"
    ))
  end

  it "renders new teacher form" do
    render

    assert_select "form[action=?][method=?]", teachers_path, "post" do

      assert_select "input#teacher_username[name=?]", "teacher[username]"

      assert_select "input#teacher_password_digest[name=?]", "teacher[password_digest]"

      assert_select "input#teacher_first_name[name=?]", "teacher[first_name]"

      assert_select "input#teacher_last_name[name=?]", "teacher[last_name]"

      assert_select "input#teacher_email[name=?]", "teacher[email]"

      assert_select "input#teacher_title[name=?]", "teacher[title]"
    end
  end
end
