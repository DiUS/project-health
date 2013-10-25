class IndicatorMeasure
  attr_reader :name
  attr_reader :ratings

  def initialize(map = {})
    map.each do |key, value| 
      instance_variable_set("@#{key}", value)
    end
  end

  def mean
    @mean ||= ( @ratings.map(&:score).inject(:+).to_f / @ratings.count )
  end

  def self.for_project(project)
    indicators = Indicator.includes(:ratings)
    indicators.map do |indicator|
      new( 
        name: indicator.name,
        ratings: indicator.ratings)
    end
  end
end