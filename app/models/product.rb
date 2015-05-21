class Product < ActiveRecord::Base
  
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  attr_accessible :color, :description, :image, :price, :title
  
  #..
  private
  # ensuring that there are no line items referencing this product
def ensure_not_referenced_by_any_line_item
   if line_items.empty?
       return true 
           else
      errors.add(:base, 'Line Items present')
       return false
    end
end

def self.search(search)
  if search
    find(:all, :conditions => ['title LIKE ?',"%#{search}%" ])
   else
     find(:all)
  end
end
  #..
  validates :title, :description, :color, :image, presence: true
  
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  
  validates :title, uniqueness: true
  
  validates :image, allow_blank: true, format:{
  with: %r{\.(gif|jpg|png)$}i,
  message: 'must be a URL for a GIF, JPEG or PNG image'
  }
end
