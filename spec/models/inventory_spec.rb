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
    let(:merchandise_lot) { create :merchandise_lot, inventory_id: inventory.id} 
    before { inventory.merchandise_lots << merchandise_lot }
    
    it { expect(inventory.valid?).to be_truthy }
    it { expect(inventory.merchandise_lots.first.name).to eq merchandise_lot.name }
  end
end
