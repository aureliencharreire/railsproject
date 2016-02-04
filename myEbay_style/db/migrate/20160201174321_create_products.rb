class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.text :description
      t.float :price

      t.timestamps null: false
    end
  end
end
