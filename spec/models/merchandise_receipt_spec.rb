require 'rails_helper'

RSpec.describe MerchandiseReceipt, type: :model do
  subject { described_class.new }

  it { expect(subject.valid?).to be_falsey }

  context "missing params" do
    it 'named' do
      expect(subject.valid?).to be_falsey
      expect(subject.errors.messages.keys).to eq %i[receipt_date unit]
      subject.errors.each do |error|
        expect(error.message).to eq "can't be blank"
      end
    end
  end

  context "valid params" do
    before do
      subject.update(receipt_date: Time.zone.yesterday, unit: :in_ton)
      subject.merchandise_lots << create(:merchandise_lot, merchandise_receipt: subject)
      subject.save
    end
    
    it { expect(subject.valid?).to be_truthy }
    it { expect(subject.merchandise_lots.count).to eq 1 }
    it { expect(subject.height).to eq subject.merchandise_lots.first.height }
  end
end
