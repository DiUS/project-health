class Iteration < ActiveRecord::Base
  validates :name, presence: true
  validates :project_id, presence: true
  validates :sort_order, numericality: { only_integer: true, :allow_blank => true }
  attr_accessible :name, :project, :project_id, :status, :sort_order

  CURRENT = 'current'
  PAST = 'past'

  belongs_to :project
  has_many :ratings
  has_many :comments

  before_create :before_save_maintain_iteration_trail

  def self.current_by_project(project)
    Iteration.where(project: project, status: CURRENT).first
  end

  def self.previous_by_iteration(iteration)
    Iteration.where(project: iteration.project, status: PAST).where("sort_order < ?", iteration.sort_order).order('sort_order DESC').first
  end

  private
  def before_save_maintain_iteration_trail
    last_iteration = Iteration.current_by_project(self.project)

    self.status = Iteration::CURRENT unless self.status
    if self.status == Iteration::CURRENT
      if last_iteration
        last_iteration.status = Iteration::PAST
        last_iteration.save!
      end
    end

    unless sort_order
      self.sort_order = 1;
      if last_iteration
          self.sort_order = last_iteration.sort_order + 1
      end
    end
  end
end
