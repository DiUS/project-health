class Iteration < ActiveRecord::Base
  validates :name, presence: true
  validates :project_id, presence: true
  attr_accessible :name
  CURRENT = 'current'
  PAST = 'past'

  belongs_to :project
  has_many :ratings
  has_many :comments

  def self.current_by_project(project)
    Iteration.where(project: project, status: CURRENT).first
  end

  def self.previous_by_iteration(iteration)
    Iteration.where(project: iteration.project, status: PAST).where("sort_order < ?", iteration.sort_order).order('sort_order DESC').first
  end
end
