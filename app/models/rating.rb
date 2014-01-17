class Rating < ActiveRecord::Base
  validates :score, presence: true
  attr_accessible :iteration, :indicator, :score
  belongs_to :iteration
  belongs_to :indicator

end