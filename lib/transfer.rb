class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50

  end

  def valid?
    if @receiver && @sender
      true
    else
      false
  end
  @sender.valid?
  @receiver.valid?
  end

  def execute_transaction
    if valid? 
      @sender.balance - @amount && @receiver.balance + @amount
    else 
      "Transaction rejected. Please check your account balance."
    end
   "complete"
  end

  def reverse_transaction

  end

end
