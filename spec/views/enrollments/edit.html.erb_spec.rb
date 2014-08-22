require 'rails_helper'

RSpec.describe "enrollments/edit", :type => :view do
  before(:each) do
    @enrollment = assign(:enrollment, Enrollment.create!(
      :student_id => 1,
      :course_id => 1
    ))
  end

  it "renders the edit enrollment form" do
    render

    assert_select "form[action=?][method=?]", enrollment_path(@enrollment), "post" do

      assert_select "input#enrollment_student_id[name=?]", "enrollment[student_id]"

      assert_select "input#enrollment_course_id[name=?]", "enrollment[course_id]"
    end
  end
end
