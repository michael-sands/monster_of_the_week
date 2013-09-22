namespace :db do
  desc "Fill database with initial or test data"
  
  task populate: :environment do 
    initial_users
  end
  
  task populate_test: :environment do
    initial_users
    test_users
  end
  
  def initial_users
    admin = User.create(name: "Admin", 
                        email: "mike@genericgames.co.nz", 
                        password: "foobar23",
                        password_confirmation: "foobar23",
                        admin: true)
    mike = User.create(name: "Michael Sands", 
                       email: "michael.sands@genericgames.co.nz", 
                       password: "foobar23",
                       password_confirmation: "foobar23",
                       admin: true)
  end
  
  def test_users
    user_one = User.create(name: "User One", 
                           email: "user.one@example.com",
                           password: "foobar",
                           password_confirmation: "foobar")
  end
  
end