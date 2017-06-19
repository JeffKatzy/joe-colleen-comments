require_relative './user-class.rb'

def get_user
  puts "Please enter your User Name:"
  answer = gets.chomp
  User.new_or_old_user(answer)
end

def view_history_user?
  puts "Would you like to see your history?"

  puts "What is your User Name?"
  user_name = gets.chomp
end
