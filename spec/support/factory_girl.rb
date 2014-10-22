RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

RSpec.configure do |config|
  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end

FactoryGirl.define do

  factory :user do
    name "Bob Jones"
    email { "bj#{rand(10000).to_s}@gmail.com" }
    password 'password'
  end

end