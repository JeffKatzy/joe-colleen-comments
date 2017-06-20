require_relative '../classes/user-class.rb'

def get_user
  puts "Please enter your User Name:"
  user_name = gets.chomp
  User.new_or_existing(user_name)
end

# def view_history_user?
#   begin
#     puts "Would you like to see your history?"
#     answer = gets.chomp
#   end while /[yYnN]/.match(answer)
#
#   if /[yY]/.match(answer)
#     puts "What is your User Name?"
#     user_name = gets.chomp
#   end
# end
