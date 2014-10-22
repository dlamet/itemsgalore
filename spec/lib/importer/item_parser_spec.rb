require 'spec_helper'
require 'app/models/concerns/import_module'
require 'lib/importer/item_parser'
require 'lib/importer/csv_parser'
require 'lib/importer/tab_parser'


RSpec.describe ItemParser do

  describe '#create_item' do

    let(:keys) { [ 'purchaser_name', 'item_description', 'item_price', 'purchase_count', 'merchant_address', 'merchant_name' ] }
    let(:values) { [ 'Bill Cutting', '50% off 10lb of beef', '36', '2', '5683 Milka Row', 'Vincent Scithe' ] }

    it 'creates an item' do
      item = subject.create_item(keys, values)
      expect(item.purchaser.name).to eq('Bill Cutting')
      expect(item.description).to eq('50% off 10lb of beef')
      expect(item.price).to eq(36)
      expect(item.purchase_count).to eq(2)
      expect(item.merchant.name).to eq('Vincent Scithe')
      expect(item.merchant.address).to eq('5683 Milka Row')
    end

    let(:fail_values) { [ 'Bill Cutting', '50% off 10lb of beef', '36', '-2', '5683 Milka Row', 'Vincent Scithe' ] }

    it 'fails to create an item' do
      expect { subject.create_item(keys, fail_values) }.to raise_error
    end

  end

end