class AddFantasyTeamToPlayer < ActiveRecord::Migration[7.0]
  def change
    add_reference :players, :fantasy_team, foreign_key: true
  end
end
