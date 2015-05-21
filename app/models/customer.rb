class Customer < ActiveRecord::Base
  has_many :orders
  attr_accessible :gender, :idnumber, :marital_status, :name, :race
end
