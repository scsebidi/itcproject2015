class Order < ActiveRecord::Base
  
  # ...
  belongs_to :customer
  has_many :line_items, dependent: :destroy
  
  # ...
    PAYMENT_METHODS = [ "Check", "Credit Card", "Purchase Order"]
    attr_accessible :address, :email, :name, :pay_method
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
        line_items << item
        
    end
  end
  
  validates :name, :address, :email, presence: true
  validates :pay_method, inclusion: PAYMENT_METHODS
  
  end
  
  
  
  
  
  
  
  
  