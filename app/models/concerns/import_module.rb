module ImportModule

  module ClassMethods

    # assumes import_key_map is provided
    def find_or_create_from_import(import_attributes)
      model_attributes = {}
      import_attributes.each_pair do |key, value|
        model_attributes[import_key_map[key.to_sym]] = value if (import_key_map.include?(key.to_sym))
      end
      instance = find_by({search_key.to_sym => model_attributes[search_key]}) if search_key
      instance = self.create(model_attributes) if instance.nil?
      instance
    end

  end

  def self.included(base)
    base.extend(ClassMethods)
  end

end
