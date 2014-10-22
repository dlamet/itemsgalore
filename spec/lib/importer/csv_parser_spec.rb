require 'spec_helper'
require 'app/models/concerns/import_module'
require 'lib/importer/item_parser'
require 'lib/importer/csv_parser'


RSpec.describe CsvParser do

  describe '#parse' do

    it 'loads the test CSV file' do
      items = CsvParser.new.parse('example_data.csv')
      expect(items.size).to eq(4)
      expect(items[0].description).to eq('$10 off $20 of food')
      expect(items[2].purchaser.name).to eq('Marty McFly')
      expect(items[3].merchant.name).to eq('Sneaker Store Emporium')
    end

  end

end