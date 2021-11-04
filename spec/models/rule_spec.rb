require 'spec_helper'

describe Rule do
  let(:categories) { %w[cat1 cat2 cat3] }

  context '#value_as_string' do
    context 'when values attribute is present' do
      subject { build(:rule, values: categories).value_as_string }

      it { is_expected.to eq(categories.join(',')) }
    end

    context 'when values attribute is present' do
      let(:price) { FFaker::Number.number }
      subject { build(:rule, values: nil, value: price).value_as_string }

      it { is_expected.to eq(price.to_s) }
    end
  end

  context '#value_attribute' do
    context 'when column attribute is an Array based on REQUIRED_FIELDS constant' do
      let(:expected_attribute) { 'values' }
      subject { build(:rule, column: 'reference').value_attribute }

      it { is_expected.to eq(expected_attribute) }
    end

    context 'when column attribute is not an Array based on REQUIRED_FIELDS constant' do
      let(:expected_attribute) { 'value' }
      subject { build(:rule, column: 'price').value_attribute }

      it { is_expected.to eq(expected_attribute) }
    end
  end

  context '#included_or_equal_to' do

    subject { 
      build(:rule, column: column, values: values, value: value).included_or_equal_to(selection)
    }  
    
    context 'when column attribute is an Array based on REQUIRED_FIELDS constant' do
      let(:column) { 'category' }
      let(:values) { categories }
      let(:value) { nil }

      context 'when selection belongs to the values attribute' do
        let(:selection) { 'cat1' }
        it { is_expected.to eq(true) }
      end

      context 'when selection does not belongs to the values attribute' do
        let(:selection) { 'cat34' }
        it { is_expected.to eq(false) }
      end
    end

    context 'when column attribute is not an Array based on REQUIRED_FIELDS constant' do
      let(:column) { 'price' }
      let(:values) { nil }
      let(:value) { 100 }

      context 'when selection is equal to the value field' do
        let(:selection) { 100 }
        it { is_expected.to eq(true) }
      end

      context 'when selection is not equal to the value field' do
        let(:selection) { 200 }
        it { is_expected.to eq(false) }
      end
    end
  end
end