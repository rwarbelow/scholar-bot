require 'rails_helper'

RSpec.describe "guardians/show", :type => :view do
  before(:each) do
    @guardian = assign(:guardian, Guardian.create!(
      :username => "Username",
      :password_digest => "Password Digest",
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
  end
end
