require 'rails_helper'

RSpec.describe "core_values/show", :type => :view do
  before(:each) do
    @core_value = assign(:core_value, CoreValue.create!(
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
