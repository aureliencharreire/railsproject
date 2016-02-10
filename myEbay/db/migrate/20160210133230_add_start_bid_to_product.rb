class AddStartBidToProduct < ActiveRecord::Migration
  def change
    add_column :products, :start_bid, :float
  end
end
