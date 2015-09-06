class Show < ActiveRecord::Base
  has_many :seasons, dependent: :destroy
  validates :title, presence: true
end
