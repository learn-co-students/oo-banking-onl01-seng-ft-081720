require 'pry'

class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount

  end

  def valid?
 
    

    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end

    # transaction_members = BankAccount.all.select{|named_account| named_account.name == @sender.name || named_account.name == @receiver.name}
    # invalid_part = transaction_members.detect do |member|
    #   member.valid?
    #   # member.status == "closed" || member.balance < 1000
    # end
    # # binding.pry

    # if invalid_part
    #   true
    # else
    #   false
    # end

  end

  def execute_transaction
   
    if @sender.valid? && @receiver.valid? && @status == "pending" && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
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
      "It has been reversed"
    end

  end




   









end
