class Rating < ActiveRecord::Base
  belongs_to :span
  belongs_to :indicator

  scope :on_project, lambda {|project| where(span_id: project.spans.current)}
end