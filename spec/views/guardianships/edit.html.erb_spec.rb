require 'rails_helper'

RSpec.describe "guardianships/edit", :type => :view do
  before(:each) do
    @guardianship = assign(:guardianship, Guardianship.create!(
      :student_id => 1,
      :guardian_id => 1
    ))
  end

  it "renders the edit guardianship form" do
    render

    assert_select "form[action=?][method=?]", guardianship_path(@guardianship), "post" do

      assert_select "input#guardianship_student_id[name=?]", "guardianship[student_id]"

      assert_select "input#guardianship_guardian_id[name=?]", "guardianship[guardian_id]"
    end
  end
end
