require 'rails_helper'

RSpec.describe "enrollments/show", :type => :view do
  before(:each) do
    @enrollment = assign(:enrollment, Enrollment.create!(
      :student_id => 1,
      :course_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
