def prompt(message)
  print(message)
  STDIN.gets.chop
end

namespace :admin do
  desc "Added new admin"
    task :new => :environment do
      email    = prompt('Email: ')
      password = prompt('Password: ')
      nick     =  prompt('Nick name: ')

      user = User.new(email: email, password: password, nick: nick, admin: true )
      if user.save
        STDERR.puts('Created new admin to database')
      else
        STDERR.puts('Cannot create a new user:')
        user.errors.full_messages.each do |message|
          STDERR.puts(" * #{message}")
        end
      end
    end
end
