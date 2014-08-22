require 'rails_helper'

RSpec.describe "core_values/edit", :type => :view do
  before(:each) do
    @core_value = assign(:core_value, CoreValue.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit core_value form" do
    render

    assert_select "form[action=?][method=?]", core_value_path(@core_value), "post" do

      assert_select "input#core_value_name[name=?]", "core_value[name]"

      assert_select "textarea#core_value_description[name=?]", "core_value[description]"
    end
  end
end
