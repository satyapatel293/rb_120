class BankAccount
  attr_accessor :user_name, :saving
  attr_reader :id
  attr_writer :checking

  def initialize(user_name, id, checking)
    @user_name = user_name
    @id = id
    @checking = checking
  end
end

bank_account = BankAccount.new('Prince', 543212345, 10000)

p bank_account.user_name # 'Prince'
bank_account.user_name = "The artist formerly known as #{bank_account.user_name}"
p bank_account.id # 543212345
# bank_account.id = 222222222 # NoMethodError
# p bank_account.checking # NoMethodError
bank_account.checking = 20000
p bank_account.saving # nil
bank_account.saving = 1000000000
p bank_account #<BankAccount:0x00007f1e26da8b58 @user_name="The artist formerly known as Prince", @id=543212345, @checking=20000, @saving=1000000000>