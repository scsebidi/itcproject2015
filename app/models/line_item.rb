class LineItem < ActiveRecord::Base
 
  belongs_to :order
  belongs_to :product
  belongs_to :cart
  attr_accessible :cart_id, :product_id
   
  def total_price
   
      #product.price * quantity
   product.price.to_s.to_d * quantity.to_s.to_d
  end
end
