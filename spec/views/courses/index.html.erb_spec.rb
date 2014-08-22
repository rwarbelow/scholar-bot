require 'rails_helper'

RSpec.describe "courses/index", :type => :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        :teacher_id => 1,
        :period => 2,
        :subject => "Subject"
      ),
      Course.create!(
        :teacher_id => 1,
        :period => 2,
        :subject => "Subject"
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
  end
end
