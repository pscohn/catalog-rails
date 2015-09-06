class Episode < ActiveRecord::Base
  belongs_to :season, dependent: :destroy
end
