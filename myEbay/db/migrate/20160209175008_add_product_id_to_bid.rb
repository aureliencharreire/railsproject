class AddProductIdToBid < ActiveRecord::Migration
  def change
    add_column :bids, :product_id, :integer
  end
end
