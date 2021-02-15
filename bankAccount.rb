module Lib
  BUCKETS = [0, 1000, 10_000, 50_000, 100_000]

  def annual_fee
    case balance # 此balance会和类中的instance变量一致对应
    when BUCKETS[0]...BUCKETS[1]
      10
    when BUCKETS[1]...BUCKETS[2]
      5
    when BUCKETS[2]...BUCKETS[3]
      3
    else
      0
    end
  end
end

class BankAccount
  attr_accessor :balance
  @@transfer_rate = 6.2

  def initialize(amount = 0)
    @balance = amount
  end

  class << self
    def usd_to_rmb(amount)
      (amount * @@transfer_rate).round(2)
    end

    def rmb_to_usd(amount)
      (amount / @@transfer_rate).round(2)
    end
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
    raise "Overdraw Alert" if @balance < 0
  end

end

