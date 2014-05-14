class ChangeColumnTypeSortOrder < ActiveRecord::Migration
  def change
    change_column :iterations, :sort_order, :integer
    change_column :indicators, :sort_order, :integer
  end
end
