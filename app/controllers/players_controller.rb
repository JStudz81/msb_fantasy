class PlayersController < ApplicationController
  def index
    @players = Player.all
    @teams = FantasyTeam.all
    @matchups = Matchup.all
    @weeks = Matchup.all.distinct.pluck("week_num")
  end

  def show
    @player = Player.find(params[:id])

    @selected_week = @player.week_stats.order("week").last.week

  end

  def updateStats
    
    #file = Tempfile.create { |f| f << params[:upload] }

    #doc = SimpleXlsxReader.open('Fantasy MSB Season 1.xlsx')
    doc = SimpleXlsxReader.open(params[:upload][:datafile].path)

    WeekStat.delete_all

    for sheet in doc.sheets
      if sheet.name.include? "Week"
        week = sheet.name[5..-1]

        rows = sheet.rows
        @headers = rows.first
        fantasy_team = ''

        rows.each_with_index do |row, index|
          if index > 1 && (row[3] == nil || row[3] == '')
            fantasy_team = FantasyTeam.find_by(owner: row[1])
          end

          if index > 2 && (row[1] != nil && row[3] != '') && !Player.exists?(name: row[1]) && (row[3] != nil && row[3] != '')
            new_player = Player.new(name: row[1], team: row[3])
            new_player.save
          end
        
          if index > 2 && Player.exists?(name: row[1])
            player = Player.find_by(name: row[1])
            weekStat = WeekStat.new(week: week.to_i, points: row[2], team: row[3], batters_faced: row[4], runs_allowed: row[5], earned_runs: row[6], batters_walked: row[7], batters_hit: row[8], hits_allowed: row[9], hrs_allowed: row[10], pitches_thrown: row[11], stamina: row[12], was_pitcher: row[13], star_pitches_thrown: row[14], player_id: player.id)
            weekStat.fantasy_team_id = fantasy_team.id
            weekStat.big_plays = row[15]
            weekStat.outs_pitched = row[16]
            weekStat.pitches_per_position = row[17]
            weekStat.batter_outs_per_position = row[18]
            weekStat.outs_per_position = row[19]
            weekStat.fielding_errors = row[20]
            weekStat.strikouts_pitched = row[21]
            weekStat.batting_avg = row[22]
            weekStat.at_bats = row[23]
            weekStat.hits = row[24]
            weekStat.singles = row[25]
            weekStat.doubles = row[26]
            weekStat.triples = row[27]
            weekStat.homeruns = row[28]
            weekStat.successful_bunts = row[29]
            weekStat.sac_flys = row[30]
            weekStat.strikeouts = row[31]
            weekStat.walks_balls = row[32]
            weekStat.walks_hit = row[33]
            weekStat.rbi = row[34]
            weekStat.bases_stolen = row[35]
            weekStat.star_hits = row[36]
            weekStat.runs_while_on_base = row[37]
            weekStat.save
          end
        end
      end
    end 

    @weekStats = WeekStat.where(week: week)

  end

  def weekStats
    @player = Player.find(params[:id])

    @weekStat = @player.week_stats.find_by(week: params[:weekNum])
  end

end
