require 'yaml'
# Keep tracks of my achievement so far.
class Achievement

  attr_reader :distance, :date

  def initialize(sport_name)
    @distance = achievements[sport_name.to_s].last["distance"]
    @date = get_date(achievements[sport_name.to_s].last["date"])
  end

  private
  def get_date(record_date)
    if record_date + 5 < CURRENT_DATE
      CURRENT_DATE
    else
      record_date + 7
    end
  end

  def achievements
    @achivements ||= YAML.load_file(File.join(File.dirname(__FILE__), 'achievements.yml'))
  end
end

