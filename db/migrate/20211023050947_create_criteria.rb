class CreateCriteria < ActiveRecord::Migration[4.2]
  def change
    create_table :criteria do |t|
      t.string :destination
    end
  end
end