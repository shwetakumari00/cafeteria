class ChangeCategoryIdColumn < ActiveRecord::Migration[6.1]
  def change
  	rename_column :products, :category, :category_id
  end
end
