require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount , :status, :bank_account  
  
  def initialize(sender,receiver,amount  )
    @sender = sender 
    @receiver = receiver 
    @amount  = amount  
    @status = "pending"
  end 
  
  def valid?
    sender.valid? 
    receiver.valid?
    end 
    
    def execute_transaction
        if  valid? == true && sender.balance > amount  && @status == "pending"
           receiver.deposit(amount )
           sender.balance = sender.balance - amount 
      @status = "complete"
    else 
      @status = "rejected"  
     return  "Transaction rejected. Please check your account balance."
    end
 end 
    def reverse_transfer 
      while @status == "complete"
      receiver.balance = receiver.balance - amount 
      sender.deposit(amount)
     @status = "reversed"
    
end 
end  

end
