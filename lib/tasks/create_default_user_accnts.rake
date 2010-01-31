namespace :hw_watch do

  desc 'create default user and admin accounts'
  task :create_default_user_accounts => ['environment'] do
    user = User.create! do |u|
      u.email = 'user@test.com'
      u.password = 'user123'
      u.password_confirmation = 'user123'
    end
    #user.confirm!
    puts 'New user created!'
    puts 'Email   : ' << user.email
    puts 'Password: ' << user.password

    admin = Admin.create! do |u|
      u.email = 'admin@test.com'
      u.password = 'admin123'
      u.password_confirmation = 'admin123'
    end
    #admin.confirm!
    puts 'New admin created!'
    puts 'Email   : ' << admin.email
    puts 'Password: ' << admin.password
  end
end
