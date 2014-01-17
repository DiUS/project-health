class Project < ActiveRecord::Base
  validates :name, presence: true
  attr_accessible :name
  has_many :iterations
  has_many :project_indicators
  has_many :indicators, :through => :project_indicators

  def add_iteration(name)
    current_iteration = Iteration.current(self)
    next_iteration = Iteration.new(name: name)
    next_iteration.project = self
    next_iteration.status = Iteration::CURRENT
    if current_iteration
      next_iteration.sort_order = current_iteration.sort_order + 1
      current_iteration.status = Iteration::PAST
      current_iteration.save
    else
      next_iteration.sort_order = 1
    end
    next_iteration.save
    next_iteration
  end

  def project_has_indicator(passed_indicator)
    project_indicators.any? {|project_indicator| project_indicator.indicator == passed_indicator}
  end
end