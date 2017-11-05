class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
    	     :recoverable, :rememberable, :trackable, :validatable

	belongs_to :current_cart, class_name: 'Cart'
	has_many :carts

end
