require 'rails_helper'

RSpec.describe "guardianships/index", :type => :view do
  before(:each) do
    assign(:guardianships, [
      Guardianship.create!(
        :student_id => 1,
        :guardian_id => 2
      ),
      Guardianship.create!(
        :student_id => 1,
        :guardian_id => 2
      )
    ])
  end

  it "renders a list of guardianships" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
