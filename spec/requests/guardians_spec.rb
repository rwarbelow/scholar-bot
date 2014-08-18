require 'rails_helper'

RSpec.describe "Guardians", :type => :request do
  describe "GET /guardians" do
    it "works! (now write some real specs)" do
      get guardians_path
      expect(response.status).to be(200)
    end
  end
end
