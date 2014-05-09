class CompletedUserVote < ActiveRecord::Base
  attr_accessible :iteration, :user

  belongs_to :user
  belongs_to :iteration 
end
