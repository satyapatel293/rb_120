
class BankAccount
  def initialize(account_number, balance, logged_in)
    @account_number = account_number
    @balance = balance
    @logged_in = logged_in
  end

  def safe_balance
    if logged_in
      balance
    else
      "You must be logged in to access that."
    end
  end

  def safe_account_number
    last_four = account_number.to_s.slice(4, 4)
    "xxxxx" + last_four
  end

  private

  attr_reader :account_number, :balance, :logged_in
end

account = BankAccount.new(32145678, 10_000, true)

p account.safe_balance # 10000
p account.account_number # NoMethodError
p account.safe_account_number # xxxxx678