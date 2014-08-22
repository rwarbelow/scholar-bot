require 'rails_helper'

RSpec.describe "courses/edit", :type => :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :teacher_id => 1,
      :period => 1,
      :subject => "MyString"
    ))
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(@course), "post" do

      assert_select "input#course_teacher_id[name=?]", "course[teacher_id]"

      assert_select "input#course_period[name=?]", "course[period]"

      assert_select "input#course_subject[name=?]", "course[subject]"
    end
  end
end
