class ChangeRatings < ActiveRecord::Migration
  def change
    change_column :ratings, :score, :numeric, size: [1,1]
  end
end
