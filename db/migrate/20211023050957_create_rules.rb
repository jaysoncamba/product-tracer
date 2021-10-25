class CreateRules < ActiveRecord::Migration[4.2]
  def change
    create_table :rules do |t|
      t.string :column
      t.string :values, array: true, default: []
      t.references :criteria
    end
  end
end