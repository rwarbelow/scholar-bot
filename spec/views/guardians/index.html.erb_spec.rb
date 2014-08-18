require 'rails_helper'

RSpec.describe "guardians/index", :type => :view do
  before(:each) do
    assign(:guardians, [
      Guardian.create!(
        :username => "Username",
        :password_digest => "Password Digest",
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email"
      ),
      Guardian.create!(
        :username => "Username",
        :password_digest => "Password Digest",
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of guardians" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
