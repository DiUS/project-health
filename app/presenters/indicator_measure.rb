class IndicatorMeasure
  attr_reader :name
  attr_reader :ratings
  attr_reader :comments

  def initialize(map = {})
    map.each do |key, value| 
      instance_variable_set("@#{key}", value)
    end
  end

  def mean
    @mean ||= calculate_mean @ratings.map(&:score)
  end

  def previous_mean
    if @previous_ratings
      @previous_mean ||= calculate_mean @previous_ratings.map(&:score)
    end
  end

  def delta
    if(mean && previous_mean)
      return "fa-level-down" if previous_mean > mean
      return "fa-level-up" if previous_mean < mean
    end
  end

  def self.for_project(project)
    current_span = Span.current(project)
    previous_span = Span.previous(project)
    project.project_indicators.map do |project_indicator|
      previous_ratings = Rating.where("span_id = ? and indicator_id = ?",previous_span.id,project_indicator.indicator.id) if previous_span
      current_rating = Rating.where("span_id = ? and indicator_id = ?",current_span.id,project_indicator.indicator.id) if current_span
      new( 
        name: project_indicator.indicator.name,
        ratings: current_rating,
        previous_ratings: previous_ratings,
        comments: Comment.where(span: current_span, indicator: project_indicator.indicator).order('id ASC') )
    end
  end

  private 
  
  def calculate_mean(values)
    values.delete_if(&:nil?)
    return nil if values.empty?

    values.inject(:+).to_f / values.count 
  end

end