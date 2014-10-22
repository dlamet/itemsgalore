require 'spec_helper'


RSpec.describe ImportFilesController, :type => :controller do

  describe '#new' do
    login_user

    it 'prepares to exec a new action' do
      get :new
      expect(response).to render_template("new")
    end

  end

  describe '#create' do
    login_user

    let(:test_params) {
      file = 'file'
      allow(file).to receive(:original_filename) { 'test_file.csv' }
      ActionController::Parameters.new({ import_file: { upload_file: file } })
    }
    let(:good_parser) {
      parser = 'parser'
      allow(parser).to receive(:parse) { [ Item.create(description: '50% off', price: '40', purchase_count: 3) ] }
      parser
    }
    let(:bad_parser) {
      parser = 'parser'
      allow(parser).to receive(:parse) { raise Exception }
      parser
    }

    it 'performs a create' do
      allow(subject).to receive(:params) { test_params }
      allow(subject).to receive(:create_parser) { good_parser }
      get :create
      expect(response).to render_template(:import_summary)
    end

    it 'fails on invalid parse' do
      allow(subject).to receive(:params) { test_params }
      allow(subject).to receive(:create_parser) { bad_parser }
      get :create
      expect(response).to render_template(:new)
    end

  end

  describe '#create_parser' do

    it 'creates a CsvParser' do
      parser = subject.send(:create_parser, 'file.csv')
      expect(parser.is_a? CsvParser).to eq(true)
    end

    it 'creates a TabParser' do
      parser = subject.send(:create_parser, 'file.tab')
      expect(parser.is_a? TabParser).to eq(true)
    end

  end

end