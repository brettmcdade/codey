class User < ActiveRecord::Base
	
  has_one :profile, :dependent => :destroy
  has_many :services, :dependent => :destroy
  has_many :events, :dependent => :destroy
  	
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation :strip_and_downcase_name
 
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  
  # Validating the presence of the name attribute
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 32 }, :format => { :with => /\A[A-Za-z0-9_]+\z/}
  
  # Creates a way for me to put name into the user route instead of just the id
  def to_param
  	name
  end
  
  def strip_and_downcase_name
    if name.present?
      name.strip!
      name.downcase!
    end
  end
  
end
