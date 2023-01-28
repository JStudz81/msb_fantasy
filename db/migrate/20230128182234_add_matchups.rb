class AddMatchups < ActiveRecord::Migration[7.0]
  def change
    create_table :matchups do |t|
      t.belongs_to :team_1, class_name: "FantasyTeam", foreign_key: "team_1_id"
      t.belongs_to :team_2, class_name: "FantasyTeam", foreign_key: "team_2_id"
      t.integer :week_num

      t.timestamps
    end
  end
end
