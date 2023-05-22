
class CashRegister
    attr_accessor :discount, :total
    attr_reader :items
  
    def initialize(discount = 0)
      @discount = discount
      @total = 0
      @items = []
      @last_item_price = 0
    end
  
    def add_item(item, price, *quant)
      if quant.count == 0
        @items << item
        @last_item_price = price
        @total += price
      else
        for i in 1..quant[0] do
          @items << item
        end
        @last_item_price = price* quant[0]
        @total += price * quant[0]
      end
    end
  
    def apply_discount
      if discount == 0
        'There is no discount to apply.'
      else
        @total = @total * (100 - discount) / 100
        "After the discount, the total comes to $#{@total}."
      end
    end
    def void_last_transaction
      @total -= @last_item_price
    end
  end