class Show < ActiveRecord::Base
  validates :title, presence: true
  has_many :seasons
end
