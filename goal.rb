#Keeps track of my goal
class Goal
  attr_reader :distance, :date, :weeks_left

  def initialize(sport_name)
    @distance = GOALS[sport_name]
    @date = GOAL_DATE
    @weeks_left = calculate_weeks_left(GOAL_DATE, CURRENT_DATE)
  end

  def should_have_reached
    distance / (1.1 ** weeks_left)  # max of 10% weekly
  end

  private

  def calculate_weeks_left(goal_date, current_date)
    days_left = goal_date - current_date
    rest_ratio = standard_rest(days_left)
    # to_i is conservative, 4weeks and a half will be counted as 4 weeks, 
    # not sure if I want that
    ((days_left*rest_ratio)/7).to_i
  end


  def standard_rest(days_left)
    #we do not have rest the last 3 weeks towards our goal, this may not be so
    # 1 week every month is resting week, I do not advance towards my goal
    if days_left > 25
      3.0/4
    else
      1
    end
  end
end

