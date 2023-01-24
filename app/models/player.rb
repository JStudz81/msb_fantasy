class Player < ApplicationRecord
    has_many :week_stats
    belongs_to :fantasy_team
end