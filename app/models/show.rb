class Show < ActiveRecord::Base
  has_many :seasons, dependent: :destroy
  validates :title, presence: true

  def num_seasons
    seasons.count
  end
end
