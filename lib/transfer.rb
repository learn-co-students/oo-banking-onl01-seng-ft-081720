class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status, :bankaccount

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if ((self.valid?) && (@status == "pending") && (@sender.balance >= @amount))
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else @sender.balance < @amount || @sender.status == "closed"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    else
      nil
    end
  end
end
