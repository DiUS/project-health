class Rating < ActiveRecord::Base
  validates :score, presence: true
  belongs_to :iteration
  belongs_to :indicator

end