require 'rails_helper'

RSpec.describe "core_values/new", :type => :view do
  before(:each) do
    assign(:core_value, CoreValue.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new core_value form" do
    render

    assert_select "form[action=?][method=?]", core_values_path, "post" do

      assert_select "input#core_value_name[name=?]", "core_value[name]"

      assert_select "textarea#core_value_description[name=?]", "core_value[description]"
    end
  end
end
