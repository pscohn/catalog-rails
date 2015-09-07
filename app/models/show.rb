class Show < ActiveRecord::Base
  has_many :seasons, dependent: :destroy
  validates :title, presence: true

  def num_seasons
    seasons.count
  end

  def num_episodes
    count = 0
    seasons.each do |season|
      count += season.episodes.count
    end
    count
  end

  def num_watched
    count = 0
    seasons.each do |season|
      count += season.episodes.where(watched: true).count
    end
    count
  end

  def next_episode
    #TODO make better
    episode = seasons.find_by(number: 1).episodes.find_by(number: 1)
    last_watched = nil
    seasons.each do |season|
      season.episodes.each do |episode|
        if episode.watched
          last_watched = episode
        end
      end
    end
    if last_watched
      next_in_season = last_watched.season.episodes.find_by(number: last_watched.number + 1)
      if next_in_season.nil?
        episode = seasons.find_by(number: last_watched.season.number + 1).episodes.find_by(number: 1)
      else
        episode = next_in_season
      end
    end
    episode
  end
end
