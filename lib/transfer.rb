class Transfer
  # # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @amount = amount
    @status = "pending"
    @sender = sender
    @receiver = receiver
  end

  def valid?
    @sender.valid? && @receiver.valid? 
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
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    else
      nil
    end
  end
end
