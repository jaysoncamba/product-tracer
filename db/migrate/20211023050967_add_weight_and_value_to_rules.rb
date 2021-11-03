class AddWeightAndValueToRules < ActiveRecord::Migration[4.2]
  def change
    add_column(:rules, :weight, :integer, default: 1, null: false)
    add_column(:rules, :value, :integer, null: true)
  end
end