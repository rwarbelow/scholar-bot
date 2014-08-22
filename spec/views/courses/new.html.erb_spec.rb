require 'rails_helper'

RSpec.describe "courses/new", :type => :view do
  before(:each) do
    assign(:course, Course.new(
      :teacher_id => 1,
      :period => 1,
      :subject => "MyString"
    ))
  end

  it "renders new course form" do
    render

    assert_select "form[action=?][method=?]", courses_path, "post" do

      assert_select "input#course_teacher_id[name=?]", "course[teacher_id]"

      assert_select "input#course_period[name=?]", "course[period]"

      assert_select "input#course_subject[name=?]", "course[subject]"
    end
  end
end
