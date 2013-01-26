
require_relative 'achievement.rb'
require_relative 'goal.rb'

#Each of the sports in the Ironman
class Sport
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def print_statistics
    
    current = Achievement.new(name)
    goal = Goal.new(name)

    weekly_improvement = weekly_improvement_needed(current, goal)
    next_week = current.distance * weekly_improvement

    if current.distance > goal.should_have_reached
      @on_track = true
    end
    way_to_go = format(weekly_improvement)

    puts header
    puts "\t Improve your #{name} by #{way_to_go} weekly"
    puts "\t Next week #{name} #{"%3.1f" % next_week}"
    puts "\t You should have reached #{ "%3.1f" % goal.should_have_reached}" unless on_track?
  end


  private

  def weekly_improvement_needed(current, goal)
    root = Rational(1,goal.weeks_left)
    (goal.distance/current.distance)**root
  end


  def header
    if on_track?
      "#{green_text('GREAT!')} For #{name} you should:"
    else
      "#{red_text('DANGER')} For #{name} you should:"
    end
  end

  def on_track?
    @on_track
  end

  def format(ratio)
    ratio_s = "%2.1f%" % ((ratio - 1)*100)
    if ratio > 1.1
      red_text(ratio_s)
    else
      ratio_s
    end
  end

  def red_text(text)
    "\033[31m#{text}\033[0m" 
  end

  def green_text(text)
    "\033[32m#{text}\033[0m" 
  end
end


