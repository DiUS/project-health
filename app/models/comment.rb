class Comment < ActiveRecord::Base
  validates :comment, presence: true
  attr_accessible :iteration, :indicator, :comment
	belongs_to :iteration
  belongs_to :indicator
end
