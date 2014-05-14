class Project < ActiveRecord::Base
  validates :name, presence: true
  attr_accessible :name
  has_many :iterations
  has_many :project_indicators
  has_many :indicators, :through => :project_indicators
  has_and_belongs_to_many :users

  def project_has_indicator(passed_indicator)
    project_indicators.any? {|project_indicator| project_indicator.indicator == passed_indicator}
  end
  
  def current_iteration
    return Iteration.current_by_project self
  end
end