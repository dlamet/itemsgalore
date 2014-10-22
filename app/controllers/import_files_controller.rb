class ImportFilesController < ApplicationController
  include Calculations

  # GET /import_files/new
  def new
    @import_file = ImportFile.new
  end

  # POST /import_files
  def create
    @import_file = ImportFile.new(params.require(:import_file).permit(:upload_file))
    file_name = @import_file.upload_file.original_filename
    parser = create_parser(file_name)
    begin
      @items = parser.parse(file_name)
      @new_gross_revenue = calculate_gross_revenue(@items)
      render 'import_summary'
    rescue Exception => e
      flash[:error] = e.to_s
      render 'new'
    end
  end

  private

  def create_parser(file_name)
    file_name.ends_with?('csv') ? CsvParser.new : TabParser.new
  end

end