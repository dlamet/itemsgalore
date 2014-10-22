module ControllerMacros

  def login_user

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      # user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end

  end

  def check_login_state(page)
    if (page.has_content?('You need to sign in or sign up'))
      new_user = User.new(email: 'tes@test.com')
      new_user.password = 'password'
      new_user.save
      fill_in 'Email', :with => 'tes@test.com'
      fill_in 'Password', :with => 'password'
      click_button 'Log in'
    end
  end

end