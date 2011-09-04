class Service < ActiveRecord::Base
	
  belongs_to :user
   
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :description, :price
  
  validates :name, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01} 
end
