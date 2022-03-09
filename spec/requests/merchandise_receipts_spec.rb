require 'rails_helper'

RSpec.describe "MerchandiseReceipts", type: :request do
  let(:inventory) { create(:inventory) }
  let(:lots_params) do
    [
      { name: 'Lote teste 1',  height: 452.9, unit: :in_kilo, inventory_id: inventory.id },
      { name: 'Lote teste 2',  height: 7.1, unit: :in_kilo, inventory_id: inventory.id }
    ]
  end
  let(:receipt_params) do
    {
      merchandise_receipt: {
        receipt_date: Time.now,
        unit: :in_ton,
        merchandise_lots_attributes: lots_params
      }
    }
  end
  let(:receipt_id) { MerchandiseReceipt.first.id }
  
  before do
    MerchandiseReceipt.create(receipt_params[:merchandise_receipt])
  end

  describe "POST /create" do
    it "returns http success" do
      post "/merchandise_receipts", params: receipt_params
      expect(response).to have_http_status(:success)
      expect(MerchandiseReceipt.count).to eq 2
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/merchandise_receipts/"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['response'].count).to eq 1
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/merchandise_receipts/#{receipt_id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["id"]).to eq receipt_id
      total_height = MerchandiseReceipt.first.merchandise_lots.inject(0){|sum, lot| sum + lot.height }
      expect(JSON.parse(response.body)["height"]).to eq total_height
    end
  end

end
