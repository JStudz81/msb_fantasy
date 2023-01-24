class CreatePlayersAndStats < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :team

      t.timestamps
    end

    create_table :week_stats do |s|
      s.integer :week
      s.float :points
      s.belongs_to :player, foreign_key: true
      s.timestamps
    end
  end
end
