class MatchupsController < ApplicationController
    def show
        @matchups = Matchup.where(week_num: params[:weekNum])
        @weeks = Matchup.all.distinct.pluck("week_num")
    end
end