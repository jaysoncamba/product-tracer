class CreateProducts < ActiveRecord::Migration[4.2]
  def change
    create_table :products do |t|
      t.string :reference
      t.string :name
      t.string :category
      t.float :price
    end
  end
end