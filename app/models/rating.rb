class Rating < ActiveRecord::Base
  belongs_to :span
  belongs_to :indicator
end