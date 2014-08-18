require "rails_helper"

RSpec.describe GuardiansController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/guardians").to route_to("guardians#index")
    end

    it "routes to #new" do
      expect(:get => "/guardians/new").to route_to("guardians#new")
    end

    it "routes to #show" do
      expect(:get => "/guardians/1").to route_to("guardians#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/guardians/1/edit").to route_to("guardians#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/guardians").to route_to("guardians#create")
    end

    it "routes to #update" do
      expect(:put => "/guardians/1").to route_to("guardians#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/guardians/1").to route_to("guardians#destroy", :id => "1")
    end

  end
end
