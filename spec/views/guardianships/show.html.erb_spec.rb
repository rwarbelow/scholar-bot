require 'rails_helper'

RSpec.describe "guardianships/show", :type => :view do
  before(:each) do
    @guardianship = assign(:guardianship, Guardianship.create!(
      :student_id => 1,
      :guardian_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
