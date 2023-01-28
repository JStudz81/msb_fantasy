class Matchup < ApplicationRecord
    belongs_to :team_1, :class_name => 'FantasyTeam', :foreign_key => 'team_1_id'
    belongs_to :team_2, :class_name => 'FantasyTeam', :foreign_key => 'team_2_id'
end