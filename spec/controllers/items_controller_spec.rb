require 'spec_helper'


RSpec.describe ItemsController, :type => :controller do

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

    it 'creates a new item' do
      post :create, :item => { description: '$5 for $10', price: 10.0, purchase_count: 1, merchant_id: 1, purchaser_id: 1 }
      expect(response).to render_template(nil)
    end

    it 'fails to create a new item on purchase count validation' do
      post :create, :item => { description: '$5 for $10', price: 10.0, purchase_count: -1, merchant_id: 1, purchaser_id: 1 }
      expect(response).to render_template('new')
    end

  end

  describe '#update' do
    login_user

    let(:item) { Item.create(description: '$3 for $6', price: 5, purchase_count: 20, merchant_id: 1, purchaser_id: 1) }

    it 'updates an item' do
      put :update, id: item.id, :item => { description: '$5 for $10', price: 10.0, purchase_count: 1, merchant_id: 1, purchaser_id: 1 }
      expect(response).to render_template(nil)
      updated_item = Item.find(item.id)
      expect(updated_item.description).to eq('$5 for $10')
      expect(updated_item.price).to eq(10)
      expect(updated_item.purchase_count).to eq(1)
    end

    it 'fails to update an item on price validation' do
      put :update, id: item.id, :item => { description: '$5 for $10', price: -1.0, purchase_count: 1, merchant_id: 1, purchaser_id: 1 }
      expect(response).to render_template('edit')
    end

  end

  describe '#destroy' do
    login_user

    let(:dead_item) { Item.create(description: '$3 for $6', price: 5, purchase_count: 20, merchant_id: 1, purchaser_id: 1) }

    it 'destroys an item' do
      delete :destroy, id: dead_item.id
      expect(response).to render_template(nil)
      expect{ Item.find(dead_item.id) }.to raise_exception
    end

  end

end