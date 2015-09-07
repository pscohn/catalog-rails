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
end
