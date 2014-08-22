require 'rails_helper'

RSpec.describe "guardianships/new", :type => :view do
  before(:each) do
    assign(:guardianship, Guardianship.new(
      :student_id => 1,
      :guardian_id => 1
    ))
  end

  it "renders new guardianship form" do
    render

    assert_select "form[action=?][method=?]", guardianships_path, "post" do

      assert_select "input#guardianship_student_id[name=?]", "guardianship[student_id]"

      assert_select "input#guardianship_guardian_id[name=?]", "guardianship[guardian_id]"
    end
  end
end
