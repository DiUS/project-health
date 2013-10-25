class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.string :name
      t.string :status
      t.integer :sort_order

      t.timestamps
    end
  end
end
