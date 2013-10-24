class Comment < ActiveRecord::Base
	belongs_to :iteration
  belongs_to :indicator
end
