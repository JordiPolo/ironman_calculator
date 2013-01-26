require 'date'

#my Goal is be able of doing one of the sports on 10% longer 
#1 month before the event.
#Also I want to know if this week I have done my long thing or not
CURRENT_DATE = Time.now.to_date
GOAL_DATE = Date.new(2013,5,8)

GOALS = { 
  run:  (1.1 * 42.2),
  bike: (1.1 * 180.25),
  swim: (1.1 * 3860.0)
}

require_relative 'sport.rb'


puts "Ironman:"
[:run,:bike, :swim].each do |sport_name|
  sport = Sport.new(sport_name).print_statistics
end

