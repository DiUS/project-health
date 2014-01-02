class Project < ActiveRecord::Base
  has_many :iterations
  has_many :project_indicators

   def project_has_indicator(passed_indicator)
      project_indicators.any? {|project_indicator| project_indicator.indicator == passed_indicator}
   end
end