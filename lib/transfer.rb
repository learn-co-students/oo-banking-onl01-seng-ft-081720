class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver , :amount
  def initialize(sender,receiver,amount)
    @sender= sender
    @receiver= receiver
    @amount= amount
    @status= "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.amount <= sender.balance && self.status == "pending" 
      sender.balance= sender.balance - self.amount
      receiver.balance= receiver.balance + self.amount 
      self.status= "complete"
    else  
      self.status= "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if  self.status == "complete"
      sender.balance= sender.balance + self.amount
      receiver.balance= receiver.balance - self.amount 
      self.status= "reversed"
    end
  end
  
end
