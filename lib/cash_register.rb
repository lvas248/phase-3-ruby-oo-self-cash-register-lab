

require 'pry'

class CashRegister
 
    attr_accessor :discount, :total, :items, :last_trans

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, qty=1)
        i = qty
        while i > 0
            self.items << title
            i-= 1
        end

        self.last_trans = {title: title, price: price, qty: qty}
        self.total += price * qty
        self.items
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = self.total - (self.total * self.discount / 100)
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction 
        #remove last tranaction items from list
        i = self.last_trans[:qty]
        while i > 0
            self.items.pop
            self.total -= self.last_trans[:price]
            i -= 1
        end
        #remove those item's costs from total
        
    end

end

luis = CashRegister.new(20)
luis.add_item("Pickle", 2, 2)
luis.void_last_transaction

binding.pry