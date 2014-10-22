require 'csv'
require_relative './item_parser.rb'


class CsvParser < ItemParser

  def parse(file_name)
    keys = nil
    items = []
    CSV.read(file_name).each do |row|
      if (keys.nil?)
        keys = row
        keys.map! { |key| key.sub(' ', '_') }
      else
        new_item = create_item(keys, row)
        items << new_item if new_item
      end
    end
    return items
  end

end