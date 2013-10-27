class Indicator < ActiveRecord::Base
	belongs_to :category
    has_many :ratings
    
    



end
