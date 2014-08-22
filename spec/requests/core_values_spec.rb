require 'rails_helper'

RSpec.describe "CoreValues", :type => :request do
  describe "GET /core_values" do
    it "works! (now write some real specs)" do
      get core_values_path
      expect(response.status).to be(200)
    end
  end
end
