require 'rails_helper'

RSpec.describe "Inventories", type: :request do
  let(:inventory_id) { Inventory.first.id } 

  before do
    create_list(:inventory, 4)
  end
  
  describe "GET /index" do
    it "returns http success" do
      get "/inventories"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["response"].count).to eq 4
    end
  end

  describe "POST /create" do
    let(:inventory_params) { { name: "Estoque 001" } } 
    
    it "returns http success" do
      post "/inventories", params: { inventory: inventory_params }
      expect(response).to have_http_status(:success)
      expect(Inventory.count).to eq 5
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/inventories/#{inventory_id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["id"]).to eq inventory_id
    end
  end

  describe "PUT /update" do
    let(:new_name) { 'Updated Name' }

    it "returns http success" do
      put "/inventories/#{inventory_id}", params: { inventory: { name: new_name } }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["name"]).to eq new_name
    end
  end

  describe "DELETE /destroy" do
    it "returns http success" do
      delete "/inventories/#{inventory_id}"
      expect(response).to have_http_status(:success)
      expect(Inventory.count).to eq 3
    end
  end

end
