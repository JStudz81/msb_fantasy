class AddFantasyTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :fantasy_teams do |t|
      t.string :team_name
      t.string :owner
      
      t.timestamps
    end
  end
end
