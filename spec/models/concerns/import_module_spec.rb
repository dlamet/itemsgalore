require 'spec_helper'


RSpec.describe ImportModule do

  class Thing
    include ImportModule

    attr_reader :name

    def initialize(name)
      @name = name
    end

    def self.import_key_map
      { thing_name: :name }
    end

    def self.search_key
      :name
    end

    def self.find_by(search_hash)
      Thing.new(search_hash[search_key])
    end

    def self.create(attributes)
      Thing.new(attributes['name'])
    end

  end

  it 'creates a new thing' do
    import_attributes = { thing_name: 'Mary' }
    thing = Thing.find_or_create_from_import(import_attributes)
    expect(thing.name).to eq('Mary')
  end

  it 'finds an existing thing' do
    Thing.create(name: 'George')
    import_attributes = { thing_name: 'George' }
    thing = Thing.find_or_create_from_import(import_attributes)
    expect(thing.name).to eq('George')
  end

end