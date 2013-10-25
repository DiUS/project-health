class Comment < ActiveRecord::Base
	belongs_to :span
  belongs_to :indicator
end
