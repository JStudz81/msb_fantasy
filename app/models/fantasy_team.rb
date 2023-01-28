class FantasyTeam < ApplicationRecord
    has_many :week_stats
    has_many :matchups
end