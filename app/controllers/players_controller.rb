class PlayersController < ApplicationController
  def index
    @players = Player.all
    @teams = FantasyTeam.all()
  end

  def show
    @player = Player.find(params[:id])

    

  end

  def updateStats
    doc = SimpleXlsxReader.open('Fantasy MSB Season 1.xlsx')

    week = params[:weekNum]

    for sheet in doc.sheets
      if sheet.name == "Week " + week
        rows = sheet.rows
        @headers = rows.first

        rows.each_with_index do |row, index|
          if index > 2 && Player.exists?(name: row[1])
            player = Player.find_by(name: row[1])
            weekStat = WeekStat.new(week: week.to_i, points: row[2], team: row[3], batters_faced: row[4], runs_allowed: row[5], earned_runs: row[6], batters_walked: row[7], batters_hit: row[8], hits_allowed: row[9], hrs_allowed: row[10], pitches_thrown: row[11], stamina: row[12], was_pitcher: row[13], star_pitches_thrown: row[14], player_id: player.id)
            weekStat.big_plays = row[15]
            weekStat.outs_pitched = row[16]
            weekStat.pitches_per_position = row[17]
            weekStat.batter_outs_per_position = row[18]
            weekStat.outs_per_position = row[19]
            weekStat.fielding_errors = row[20]
            weekStat.batting_avg = row[21]
            weekStat.at_bats = row[22]
            weekStat.hits = row[23]
            weekStat.singles = row[24]
            weekStat.doubles = row[25]
            weekStat.triples = row[26]
            weekStat.homeruns = row[27]
            weekStat.successful_bunts = row[28]
            weekStat.sac_flys = row[29]
            weekStat.strikeouts = row[30]
            weekStat.walks_balls = row[31]
            weekStat.walks_hit = row[32]
            weekStat.rbi = row[33]
            weekStat.bases_stolen = row[34]
            weekStat.star_hits = row[35]
            weekStat.runs_while_on_base = row[36]
            weekStat.save
          end
        end
      end
    end 

    @weekStats = WeekStat.where(week: week)

  end
end
