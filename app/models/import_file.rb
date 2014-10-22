class ImportFile
  include ActiveModel::Model

  attr_accessor :upload_file

  validates_presence_of :upload_file

end