require 'rails_helper'

RSpec.describe Inventory, type: :model do
  subject { described_class.new }

  it { expect(subject.valid?).to be_falsey }
  
  context "with valid params" do
    before { subject.name = 'NamedInventory' }
    it { expect(subject.valid?).to be_truthy }
  end
  
  context "with a lot" do
    let(:inventory) { create :inventory }
    let(:merchandise_lot) { double MerchandiseLot, name: "Lote name" }

    before do
      allow(inventory).to receive(:merchandise_lots).and_return([merchandise_lot])
    end
    
    it { expect(inventory.valid?).to be_truthy }
    it { expect(inventory.merchandise_lots.first.name).to eq merchandise_lot.name }
  end
end
