class AddFantasyTeamToPlayer < ActiveRecord::Migration[7.0]
  def change
    add_reference :week_stats, :fantasy_team, foreign_key: true
  end
end
