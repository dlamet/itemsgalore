require_relative 'concerns/import_module'


class Merchant < ActiveRecord::Base
  include ImportModule

  has_many :items

  validates :name, presence: true, uniqueness: true

  def self.import_key_map
    { merchant_name: :name, merchant_address: :address }
  end

  def self.search_key
    :name
  end

end
