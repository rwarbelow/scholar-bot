require 'rails_helper'

RSpec.describe "courses/show", :type => :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :teacher_id => 1,
      :period => 2,
      :subject => "Subject"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Subject/)
  end
end
