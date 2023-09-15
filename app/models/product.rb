class Product < ApplicationRecord
	belongs_to :category, dependent: :destroy
	has_one_attached :image
    has_many :order_items 



end
