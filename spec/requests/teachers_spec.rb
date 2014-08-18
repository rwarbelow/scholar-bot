require 'rails_helper'

RSpec.describe "Teachers", :type => :request do
  describe "GET /teachers" do
    it "works! (now write some real specs)" do
      get teachers_path
      expect(response.status).to be(200)
    end
  end
end
