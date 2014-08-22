require "rails_helper"

RSpec.describe CoreValuesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/core_values").to route_to("core_values#index")
    end

    it "routes to #new" do
      expect(:get => "/core_values/new").to route_to("core_values#new")
    end

    it "routes to #show" do
      expect(:get => "/core_values/1").to route_to("core_values#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/core_values/1/edit").to route_to("core_values#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/core_values").to route_to("core_values#create")
    end

    it "routes to #update" do
      expect(:put => "/core_values/1").to route_to("core_values#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/core_values/1").to route_to("core_values#destroy", :id => "1")
    end

  end
end
