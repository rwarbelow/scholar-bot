require 'rails_helper'

RSpec.describe "core_values/index", :type => :view do
  before(:each) do
    assign(:core_values, [
      CoreValue.create!(
        :name => "Name",
        :description => "MyText"
      ),
      CoreValue.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of core_values" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
