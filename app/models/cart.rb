class Cart < ActiveRecord::Base
	belongs_to :user
	belongs_to :current_cart
	has_many :line_items
	has_many :items, through: :line_items

	def total
		self.line_items.map {|line_i| line_i.item.price * line_i.quantity}.reduce(:+)
	end

	def add_item(item_id)
		if new_line_item = self.line_items.find_by(item_id: item_id)
			new_line_item
		else
			self.line_items.build(item_id: item_id)
		end
	end

	def finalize_checkout
		self.status = "submitted"
		self.line_items.each do |line_i|
			item = Item.find_by(id: line_i.item_id)
			item.inventory -= line_i.quantity
			item.save
		end
	end

end
