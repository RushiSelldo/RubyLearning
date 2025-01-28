class Bank
  $bankname = "Sell Do Bank"
end

class User < Bank
  attr_reader :balance, :username

  def initialize(name, pass, balance = 0)
    @username = name
    @password = pass
    @balance = balance
  end

  def authenticate(pass)
    @password == pass
  end

  def bankname
    puts "Bank Name: #{$bankname}"
  end

  def update_balance(amount)
    @balance += amount
  end
end

class Operations
  def initialize
    @transactions = []
  end

  def check_balance(user)
    puts "Current Balance for #{user.username}: $#{user.balance}"
  end

  def deposit(user)
    puts "Enter the amount to deposit:"
    amount = gets.chomp.to_f
    if amount > 0
      user.update_balance(amount)
      puts "Successfully deposited $#{amount}. New balance: $#{user.balance}"
      @transactions << { user: user.username, type: "Deposit", amount: amount }
    else
      puts "Invalid amount entered."
    end
  end

  def withdraw(user)
    puts "Enter the amount to withdraw:"
    amount = gets.chomp.to_f
    if amount > 0 && amount <= user.balance
      user.update_balance(-amount)
      puts "Successfully withdrew $#{amount}. New balance: $#{user.balance}"
      @transactions << { user: user.username, type: "Withdraw", amount: amount }
    elsif amount > user.balance
      puts "Insufficient balance."
    else
      puts "Invalid amount entered."
    end
  end

  def transfer(sender, recipient)
    puts "Enter the amount to transfer:"
    amount = gets.chomp.to_f
    if amount > 0 && amount <= sender.balance
      sender.update_balance(-amount)
      recipient.update_balance(amount)
      puts "Successfully transferred $#{amount} from #{sender.username} to #{recipient.username}."
      @transactions << { from: sender.username, to: recipient.username, type: "Transfer", amount: amount }
    elsif amount > sender.balance
      puts "Insufficient balance to complete the transfer."
    else
      puts "Invalid amount entered."
    end
  end

  def transaction_history
    puts "Transaction History:"
    @transactions.each do |transaction|
      if transaction[:type] == "Transfer"
        puts "#{transaction[:from]} transferred $#{transaction[:amount]} to #{transaction[:to]}"
      else
        puts "#{transaction[:user]} #{transaction[:type]}ed $#{transaction[:amount]}"
      end
    end
  end

  def authenticate_user(users)
    puts "Enter your username:"
    name = gets.chomp

    puts "Enter your password:"
    pass = gets.chomp

    user = users.find { |u| u.username == name && u.authenticate(pass) }

    if user
      puts "Login successful! Welcome, #{user.username}."
      user
    else
      puts "Invalid credentials. Access denied."
      nil
    end
  end
end

# User Initialization
users = [
  User.new("Rushi", "pass", 1000),
  User.new("Alice", "1234", 500),
  User.new("Bob", "abcd", 750)
]

ops = Operations.new

loop do
  puts "\nWelcome to #{$bankname}!"
  puts "1. Login"
  puts "2. Exit"
  main_choice = gets.chomp.to_i

  case main_choice
  when 1
    current_user = ops.authenticate_user(users)
    if current_user
      loop do
        puts "\nChoose an operation:"
        puts "1. Check Balance"
        puts "2. Deposit"
        puts "3. Withdraw"
        puts "4. Transfer Money"
        puts "5. Transaction History"
        puts "6. Logout"
        choice = gets.chomp.to_i

        case choice
        when 1
          ops.check_balance(current_user)
        when 2
          ops.deposit(current_user)
        when 3
          ops.withdraw(current_user)
        when 4
          puts "Enter the recipient's username:"
          recipient_name = gets.chomp
          recipient = users.find { |u| u.username == recipient_name }

          if recipient && recipient != current_user
            ops.transfer(current_user, recipient)
          elsif recipient == current_user
            puts "You cannot transfer money to yourself."
          else
            puts "Recipient not found."
          end
        when 5
          ops.transaction_history
        when 6
          puts "Logged out successfully."
          break
        else
          puts "Invalid choice. Please try again."
        end
      end
    end
  when 2
    puts "Thank you for using #{$bankname}! Goodbye."
    break
  else
    puts "Invalid choice. Please try again."
  end
end
