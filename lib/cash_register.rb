class CashRegister
  attr_accessor :total, :last_transaction
  attr_reader :discount, :items
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(item, price, quantity = 1)
    @last_transaction = price * quantity
    self.total = self.total + self.last_transaction
    
    while quantity > 0
      self.items << item
      quantity = quantity - 1
    end
  end
  
  def apply_discount
    if !(self.discount > 0)
      return 'There is no discount to apply.'
    end

    self.total = self.total - self.total * discount / 100
    "After the discount, the total comes to $#{self.total}."
  end
  
  def void_last_transaction
    self.total = self.total - self.last_transaction
  end
end