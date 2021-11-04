require 'spec_helper'

describe Product do
  context '#valid?' do
    context 'with valid attributes' do
      subject { build(:product).valid? }

      it { is_expected.to be(true) }
    end

    context 'when invalid attributes' do
      subject { build(:product, reference: nil, category: nil, name: nil, price: nil) }
      let(:error_messages) do
        {
          reference: ["can't be blank"],
          name: ["can't be blank"],
          category: ["can't be blank"],
          price: ["can't be blank"],
        }
      end
      it 'should return false' do
        expect(subject.valid?).to eq(false)
        expect(subject.errors.messages).to match(error_messages)
      end
    end
  end
end