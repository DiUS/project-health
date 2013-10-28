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

  def previous_mean
    @previous_mean ||= calculate_mean @previous_ratings.map(&:score)
  end

  def delta
    if(mean && previous_mean)
      return "fa-level-down" if previous_mean > mean
      return "fa-level-up" if previous_mean < mean
    end
  end

  def health
    @health ||= calculate_health(mean)
  end

  def self.for_project(project)
    current_span = project.spans.current
    previous_span = project.spans.previous
    project.project_indicators.map do |project_indicator|
      new( 
        name: project_indicator.indicator.name,
        ratings: project_indicator.indicator.ratings.on_span(current_span),
        previous_ratings: project_indicator.indicator.ratings.on_span(previous_span) )
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