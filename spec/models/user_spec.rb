require 'spec_helper'


RSpec.describe User do

  describe '.from_omniauth' do

    let(:info) {
      info = 'info'
      allow(info).to receive(:email) { 'joe@yahoo.com' }
      allow(info).to receive(:name) { 'Joe Black' }
      info
    }
    let(:auth) {
      auth = 'auth'
      allow(auth).to receive(:provider) { 'FaceBook' }
      allow(auth).to receive(:uid) { '11-22-33-44' }
      allow(auth).to receive(:info) { info }
      auth
    }

    it 'creates a new user' do
      new_user = User.from_omniauth(auth)
      expect(new_user.name).to eq('Joe Black')
      expect(new_user.email).to eq('joe@yahoo.com')
    end

  end

  describe '.new_with_session' do

    let(:session) { { 'devise.facebook_data' => { 'extra' => { 'raw_info' => :here }, 'email' => 'biggie@msn.com' } } }
    let(:user_name) { 'Buffalo Bill' }
    let(:user) { User.create(name: user_name, email: 'bbill@wildwildwest.org', password: 'password' ) }
    let(:params) { { name: user_name } }

    it "sets the user's email to the OmniAuth email" do
      User.new_with_session(params, session)
      user_updated = User.find(user.id)
      expect(user_updated.email).to eq('bbill@wildwildwest.org')
    end

  end

end