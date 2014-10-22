first_user = User.new(name: 'Jim Test', email: 'jim.test@gmail.com')
first_user.password = 'password'
first_user.save!

Merchant.create(name: "Igor's Palace", address: '123 Guilded Lane')
Merchant.create(name: "Winter Wonderland", address: '843 Northern Hwy')

Purchaser.create(name: 'Woolworth')
Purchaser.create(name: 'Acme')
