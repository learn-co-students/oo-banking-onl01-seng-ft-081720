require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if @status == "pending" && valid?
      # binding.pry
      if @sender.balance >= @amount
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      elsif @sender.balance < @amount
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
