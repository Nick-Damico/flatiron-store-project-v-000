class LineItemsController < ApplicationController

	def show

	end
	def create
		
		item = Item.find_by(id: params[:item_id])
		if !current_user.current_cart
			current_user.current_cart = current_user.carts.create()			
		end
		if current_user.current_cart.items.include?(item)

			 line_i = current_user.current_cart.line_items.find_by(item_id: item.id)
			 line_i.quantity += 1
			 line_i.save

		end
		current_user.current_cart.line_items << current_user.current_cart.add_item(params[:item_id])

		current_user.save	
		redirect_to cart_path(current_user.current_cart)
	end
	# current_user.current_cart.line_items.create(item: item)
end
