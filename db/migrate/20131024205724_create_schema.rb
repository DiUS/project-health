class CreateSchema < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
    end

    create_table :iterations do |t|
      t.belongs_to :project
      t.string :name
      t.string :status
      t.integer :sort_order
    end

    add_foreign_key(:iterations, :project)
    add_index(:iterations, :project_id)

    create_table :categories do |t|
      t.string :name
    end

    create_table :indicators do |t|
      t.belongs_to :category
      t.string :name
      t.text :description
      t.string :one_label
      t.string :five_label
      t.integer :sort_order
    end

    add_foreign_key(:indicators, :category)
    add_index(:indicators, :category_id)

    create_table :ratings do |t|
      t.belongs_to :iteration
      t.belongs_to :indicator
      t.integer :score
    end

    add_foreign_key(:ratings, :iteration)
    add_foreign_key(:ratings, :indicator)
    add_index(:ratings, :iteration_id)
    add_index(:ratings, :indicator_id)

    create_table :comments do |t|
      t.belongs_to :iteration
      t.belongs_to :indicator
      t.integer :score
    end

    add_foreign_key(:comments, :iteration)
    add_foreign_key(:comments, :indicator)
    add_index(:comments, :iteration_id)
    add_index(:comments, :indicator_id)
  end
end
