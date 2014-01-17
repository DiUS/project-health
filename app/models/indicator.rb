class Indicator < ActiveRecord::Base
  validates :name, presence: true
  validates :category_id, presence: true
  attr_accessible :name, :description, :one_label, :five_label, :sort_order, :category_id
	belongs_to :category
    has_many :ratings
    has_many :comments
    has_many :project_indicators

end
