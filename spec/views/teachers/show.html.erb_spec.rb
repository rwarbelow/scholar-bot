require 'rails_helper'

RSpec.describe "teachers/show", :type => :view do
  before(:each) do
    @teacher = assign(:teacher, Teacher.create!(
      :username => "Username",
      :password_digest => "Password Digest",
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Title/)
  end
end
