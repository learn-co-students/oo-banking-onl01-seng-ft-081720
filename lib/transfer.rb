class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
  sender_good = BankAccount.new(sender).valid?
  receiver_good = BankAccount.new(receiver).valid?

    sender_good
    receiver_good

  # if sender_good == receiver_good && receiver_good == true
  #   true
  # end
  # # binding.pry
end


end
