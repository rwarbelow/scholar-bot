require 'rails_helper'

RSpec.describe "students/edit", :type => :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :username => "MyString",
      :password_digest => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :student_id => 1,
      :grade => 1,
      :gender => "MyString"
    ))
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do

      assert_select "input#student_username[name=?]", "student[username]"

      assert_select "input#student_password_digest[name=?]", "student[password_digest]"

      assert_select "input#student_first_name[name=?]", "student[first_name]"

      assert_select "input#student_last_name[name=?]", "student[last_name]"

      assert_select "input#student_email[name=?]", "student[email]"

      assert_select "input#student_student_id[name=?]", "student[student_id]"

      assert_select "input#student_grade[name=?]", "student[grade]"

      assert_select "input#student_gender[name=?]", "student[gender]"
    end
  end
end
