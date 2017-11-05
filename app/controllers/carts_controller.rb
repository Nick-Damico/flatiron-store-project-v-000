class CartsController < ApplicationController
	
	def index
	end

	def new
	end

	def show
		@cart = Cart.find(params[:id])		
	end

	def checkout
		@cart = Cart.find(params[:id])
		@cart.finalize_checkout
		@cart.total
		current_user.current_cart = nil 
		current_user.save
		redirect_to cart_path(params[:id])
	end
end
