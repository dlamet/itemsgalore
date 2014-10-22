
namespace :admin do

  desc "create new user"
  task :new_user, [:name, :email, :password] => [:environment] do |t, args|
    name = args[:name]
    email = args[:email]
    password = args[:password]
    puts "name=#{name}, email=#{email}, password=#{password}"

    user = User.new(name: name, email: email)
    user.password = password
    user.save!
  end

end
