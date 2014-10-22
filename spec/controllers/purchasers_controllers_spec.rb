require 'spec_helper'


RSpec.describe PurchasersController, :type => :controller do

  describe '#index' do
    login_user

    it 'displays index view' do
      get :index
      expect(response).to render_template("index")
    end

  end

  describe '#new' do
    login_user

    it 'displays new view' do
      get :new
      expect(response).to render_template("new")
    end

  end

  describe '#create' do
    login_user

    it 'creates a new purchaser' do
      post :create, :purchaser => { name: 'Dave the Dealer' }
      expect(response).to render_template(nil)
    end

    it 'fails to create a new purchaser on name presence validation' do
      post :create, :purchaser => { name: nil }
      expect(response).to render_template('new')
    end

    it 'fails to create a new purchaser on name uniqueness validation' do
      Purchaser.create(name: "Greedy Gus's Emporium")
      post :create, :purchaser => { name: "Greedy Gus's Emporium" }
      expect(response).to render_template('new')
    end

  end

  describe '#update' do
    login_user

    let(:purchaser) { Purchaser.create(name: "The Big Warehouse") }
    let(:new_name) { 'The Gigantic Warehouse' }

    it 'updates a purchaser' do
      put :update, id: purchaser.id, :purchaser => { name: new_name }
      expect(response).to render_template(nil)
      updated_purchaser = Purchaser.find(purchaser.id)
      expect(updated_purchaser.name).to eq(new_name)
    end

    it 'fails to update a purchaser without a unique name' do
      put :update, id: purchaser.id, :purchaser => { name: nil }
      expect(response).to render_template('edit')
    end

  end

  describe '#destroy' do
    login_user

    let(:dead_purchaser) { Purchaser.create(name: "Exotic Imports") }

    it 'destroys a purchaser' do
      delete :destroy, id: dead_purchaser.id
      expect(response).to render_template(nil)
      expect{ Purchaser.find(dead_merchant.id) }.to raise_exception
    end

  end

end