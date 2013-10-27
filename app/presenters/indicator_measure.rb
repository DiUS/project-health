class IndicatorMeasure
  attr_reader :name
  attr_reader :ratings

  def initialize(map = {})
    map.each do |key, value| 
      instance_variable_set("@#{key}", value)
    end
  end

  def mean
    @mean ||= calculate_mean @ratings.map(&:score)
  end

  def health
    @health ||= calculate_health(mean)
  end

  def self.for_project(project)
    project_indicators = project.project_indicators
    project_indicators.map do |project_indicator|
      new( 
        name: project_indicator.indicator.name,
        ratings: project_indicator.indicator.ratings.on_project(project) )
    end
  end

  private 
  
  def calculate_mean(values)
    values.delete_if(&:nil?)
    return nil if values.empty?

    values.inject(:+).to_f / values.count 
  end
  
  def calculate_health(value)
    return '' if value.nil?;
    return 'deathly' if value <= 1
    return 'ill' if value <= 2
    return 'fine' if value < 3
    return 'good' if value < 4
    'healthy'
  end

end