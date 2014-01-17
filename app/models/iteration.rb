class Iteration < ActiveRecord::Base
  validates :name, presence: true
  CURRENT = 'current'
  PAST = 'past'

  belongs_to :project
  has_many :ratings

  def self.current(project)
    Iteration.where(project: project, status: CURRENT).first
  end

  def self.previous(project)
    Iteration.where(project: project, status: PAST).order('sort_order DESC').first
  end
end
