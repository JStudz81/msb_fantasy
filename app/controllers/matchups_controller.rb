class MatchupsController < ApplicationController
    include ActionView::Helpers::NumberHelper

    def show
        @matchups = Matchup.where(week_num: params[:weekNum])
        @week_num = params[:weekNum]
        @weeks = Matchup.all.distinct.pluck("week_num")


    
    end
end