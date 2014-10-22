require_relative 'concerns/import_module'


class Purchaser < ActiveRecord::Base
  include ImportModule

  has_many :items

  validates :name, presence: true, uniqueness: true

  def self.import_key_map
    { purchaser_name: :name }
  end

  def self.search_key
    :name
  end

end
