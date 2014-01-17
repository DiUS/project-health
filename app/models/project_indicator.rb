class ProjectIndicator < ActiveRecord::Base
  attr_accessible :project, :indicator
  belongs_to :project
  belongs_to :indicator

end