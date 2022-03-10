require 'rails_helper'

RSpec.describe MerchandiseLot, type: :model do
  subject { described_class.new }
  let(:inventory) { create :inventory }

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
end
