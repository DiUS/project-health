class CreateSchema < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
    end

    create_table :iterations do |t|
      t.belongs_to :project
      t.string :name
      t.string :status
      t.time :from
      t.time :to
      t.integer :sort_order
    end

    add_foreign_key(:iterations, :projects)
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

    add_foreign_key(:indicators, :categories)
    add_index(:indicators, :category_id)

    create_table :project_indicators do |t|
      t.integer :project_id
      t.integer :indicator_id
    end

    add_foreign_key(:project_indicators, :indicators)
    add_index(:project_indicators, :indicator_id)
    add_foreign_key(:project_indicators, :projects)
    add_index(:project_indicators, :project_id)

    create_table :ratings do |t|
      t.belongs_to :iteration
      t.belongs_to :indicator
      t.integer :score
    end

    add_foreign_key(:ratings, :iterations)
    add_foreign_key(:ratings, :indicators)
    add_index(:ratings, :iteration_id)
    add_index(:ratings, :indicator_id)

    create_table :comments do |t|
      t.belongs_to :iteration
      t.belongs_to :indicator
      t.text :comment
    end

    add_foreign_key(:comments, :iterations)
    add_foreign_key(:comments, :indicators)
    add_index(:comments, :iteration_id)
    add_index(:comments, :indicator_id)
  end
end
