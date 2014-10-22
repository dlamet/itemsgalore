require 'spec_helper'


RSpec.describe MerchantsController, :type => :controller do

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

    it 'creates a new merchant' do
      post :create, :merchant => { name: "Jaws Shop", address: '1 Tooth Row' }
      expect(response).to render_template(nil)
    end

    it 'fails to create a new merchant on name presence validation' do
      post :create, :merchant => { address: '1 Tooth Row' }
      expect(response).to render_template('new')
    end

    it 'fails to create a new merchant on name uniqueness validation' do
      Merchant.create(name: 'Hard Sell', address: 'Saturday Market')
      post :create, :merchant => { name: 'Hard Sell', address: 'Tuesday Market' }
      expect(response).to render_template('new')
    end

  end

  describe '#update' do
    login_user

    let(:merchant) { Merchant.create(name: "The Nickel Store", address: 'Suite B Dark Alley') }

    it 'updates a merchant' do
      put :update, id: merchant.id, :merchant => { address: '752 Sweetwater Lane' }
      expect(response).to render_template(nil)
      updated_merchant = Merchant.find(merchant.id)
      expect(updated_merchant.name).to eq(merchant.name)
      expect(updated_merchant.address).to eq('752 Sweetwater Lane')
    end

    it 'fails to update a merchant without a valid name' do
      put :update, id: merchant.id, :merchant => { name: nil }
      expect(response).to render_template('edit')
    end

  end

  describe '#destroy' do
    login_user

    let(:dead_merchant) { Merchant.create(name: "Ivan's Caviar", address: "12 Stately Manner") }

    it 'destroys a merchant' do
      delete :destroy, id: dead_merchant.id
      expect(response).to render_template(nil)
      expect{ Merchant.find(dead_merchant.id) }.to raise_exception
    end

  end

end