class Rating < ActiveRecord::Base
  belongs_to :span
  belongs_to :indicator

  scope :on_span, lambda {|span| where(span_id: span.id)}
end