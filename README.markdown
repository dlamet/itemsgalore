Renewable Funding: Code Challenge
=================================

Welcome to my code challenge solution.  I wrote the solution on a Mac, so I'd expect best results on OS X.  

I created a scaffold for items, added devise for authentication, and implemented the upload and import such that CSV and tab delimited files are supported.   The code assumed proper subscripts of either 'csv' or 'tab' to designate the type.  Error checking of contents would be more robust in a production application.  I created a test file for tab delimited data, 'example_data.tab'.  Gross revenue is tallied on a summary page after import.

## Deployment Instructions

1. Ensure that the destination server is configured with Ruby 2.1.2, Rails 4.1 and reasonably up to date SQLite.
1. Ensure that port 3000 is free
1. Clone the application to its destination directory.
1. Initialize the database by running $ rake db:create, $ rake db:migrate, and $ rake db:seed
1. Create a new user if desired (see User Management Section below.)
1. Run the server $ rails server
1. Open a browser to http://3000

#### User Management

Running seed creates a single initial user:

  email: jim.test@gmail.com
  password: password

Also, there is a rake task that may be used to create additional users.  The command takes an email and password like this:

  $ rake admin:new_user['Willard Scoot',willard_scott@yahoo.com,password]

Note that in zshell, the brackets must be escaped.

#### Functionality

The application implements the following features:
* full CRUD pages for users, merchants, and purchasers,
* the ability to import the example_input.tab file, displaying total gross revenue,
* handle authentication or authorization using devise,
* supports open authorization through Facebook,

## Developer Notes

#### Import Module

The object oriented approach to the creation of the imported objects is probably overkill for the size of this project.  But it demonstrates a scalable design that abstracts the behavior.

Note further that I use the find_or_create_from_import for Item.  The only significant cost to this is that if a new item is required, it gets saved twice, once when it is initially created with its attributes, and then once when its merchant and purchaser relationships are assigned.  This could be optimized by either passing the objects into a more sophistocated find_or_create_from_import method or creating Item another way.

#### Testing

Depending on company and project expectations I would normally test drive a project like this.  At Fiduciary Benchmarks we had an excellent testing track record.  But since I was told not to spend too much time on it I've instead opted to provide a sample of the kinds of tests I would write for an app like this. I have one unit test and one integration test written in RSpec.
