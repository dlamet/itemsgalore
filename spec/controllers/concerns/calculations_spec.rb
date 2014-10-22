require 'spec_helper'


RSpec.describe Calculations do

  describe '#calculate_gross_revenue' do
    include Calculations

    class ItemMock
      attr_reader :price, :purchase_count
      def initialize(price, purchase_count)
        @price = price
        @purchase_count = purchase_count
      end
    end

    let(:item_list) { [ ItemMock.new(5, 3), ItemMock.new(1.5, 6), ItemMock.new(8, 5) ] }

    it 'total gross revenue for given items' do
      expect(calculate_gross_revenue(item_list)).to eq(64)
    end

    it 'total gross revenue for no items' do
      expect(calculate_gross_revenue([])).to eq(0)
    end

  end

end