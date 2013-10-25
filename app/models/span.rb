class Span < ActiveRecord::Base
	belongs_to :project


	def determine_start_of_span
    	required_spans = Span.where('created_at < ?',created_at).order("created_at")
    	if required_spans == 0 || required_spans.empty?
    		"start of project"
    	else
    		required_spans.first.created_at.strftime('%e-%m-%y %H:%M')
    	end
    end

end
