class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.string :name
      t.text :description
      t.string :one_label
      t.string :five_label
      t.integer :sort_order

      t.timestamps
    end
  end
end
