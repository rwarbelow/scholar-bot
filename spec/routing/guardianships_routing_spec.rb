require "rails_helper"

RSpec.describe GuardianshipsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/guardianships").to route_to("guardianships#index")
    end

    it "routes to #new" do
      expect(:get => "/guardianships/new").to route_to("guardianships#new")
    end

    it "routes to #show" do
      expect(:get => "/guardianships/1").to route_to("guardianships#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/guardianships/1/edit").to route_to("guardianships#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/guardianships").to route_to("guardianships#create")
    end

    it "routes to #update" do
      expect(:put => "/guardianships/1").to route_to("guardianships#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/guardianships/1").to route_to("guardianships#destroy", :id => "1")
    end

  end
end
