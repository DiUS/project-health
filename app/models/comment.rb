class Comment < ActiveRecord::Base
  validates :comment, presence: true
	belongs_to :iteration
  belongs_to :indicator
end
