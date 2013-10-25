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
    indicators = Indicator.all
    indicators.map do |indicator|
      new( 
        name: indicator.name,
        ratings: indicator.ratings.on_project(project) )
    end
  end

  private 
  
  def calculate_mean(values)
    values.delete_if(&:nil?)
    values.inject(:+).to_f / values.count 
  end
  
  def calculate_health(value)
    return 'deathly' if value <= 1
    return 'ill' if value <= 2
    return 'fine' if value < 3
    return 'good' if value < 4
    'healthy'
  end

end