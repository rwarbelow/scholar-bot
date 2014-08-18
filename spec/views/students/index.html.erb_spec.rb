require 'rails_helper'

RSpec.describe "students/index", :type => :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        :username => "Username",
        :password_digest => "Password Digest",
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :student_id => 1,
        :grade => 2,
        :gender => "Gender"
      ),
      Student.create!(
        :username => "Username",
        :password_digest => "Password Digest",
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :student_id => 1,
        :grade => 2,
        :gender => "Gender"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
  end
end
