require_relative 'concerns/import_module'


class Item < ActiveRecord::Base
  include ImportModule

  belongs_to :merchant
  belongs_to :purchaser

  validates_presence_of :description
  validates_numericality_of :price, greater_than_or_equal_to: 0.0
  validates_numericality_of :purchase_count, greater_than_or_equal_to: 0
  validates_presence_of :merchant_id
  validates_presence_of :purchaser_id

  def self.import_key_map
    { item_description: :description, item_price: :price, purchase_count: :purchase_count }
  end

  def self.search_key
  end

end
