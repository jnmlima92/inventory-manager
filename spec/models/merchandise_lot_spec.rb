require 'rails_helper'

RSpec.describe MerchandiseLot, type: :model do
  subject { described_class.new }
  let(:inventory) { create :inventory }
  let(:receipt) { create :merchandise_receipt }

  it { expect(subject.valid?).to be_falsey }

  context "missing params" do
    it 'named' do
      expect(subject.valid?).to be_falsey
      expect(subject.errors.messages.keys).to eq %i[name height unit inventory merchandise_receipt]

      subject.errors.each do |error|
        if %i[inventory merchandise_receipt].include? error.attribute
          expect(error.message).to eq 'must exist'
        else
          expect(error.message).to eq "can't be blank"
        end
      end
    end
  end

  context "valid params" do
    before do
      subject.name = 'NamedLot'
      subject.height = 198.25
      subject.unit = :in_kilo
      subject.inventory = inventory
      subject.merchandise_receipt = receipt
      subject.save
    end
    
    it { expect(subject.valid?).to be_truthy }
    it { expect(subject.in_kilo?).to be_truthy }
    it { expect(subject.inventory_id).to eq inventory.id }
    it { expect(subject.inventory.name).to eq inventory.name }
    it { expect(subject.merchandise_receipt_id).to eq receipt.id }
  end
end
