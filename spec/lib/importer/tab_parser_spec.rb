require 'spec_helper'
require 'app/models/concerns/import_module'
require 'lib/importer/item_parser'
require 'lib/importer/tab_parser'


RSpec.describe TabParser do

  describe '#parse' do

    it 'loads the test tab delimited file' do
      items = TabParser.new.parse('example_data.tab')
      expect(items.size).to eq(3)
      expect(items[0].description).to eq('$5 off 20 pack wedding photos')
      expect(items[1].purchaser.name).to eq('Bruce Wayne')
      expect(items[2].merchant.name).to eq('MiB')
    end

  end

  describe '#digest_line' do

    let(:line) { "field 1\tfield 2\tfield 3" }

    it 'digests a line' do
      fields = TabParser.new.digest_line(line)
      expect(fields.size).to eq(3)
      expect(fields[0]).to eq('field 1')
      expect(fields[1]).to eq('field 2')
      expect(fields[2]).to eq('field 3')
    end

  end

end