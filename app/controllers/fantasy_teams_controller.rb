class FantasyTeamsController < ApplicationController
  def index
    @teams = FantasyTeam.all()
  end
  
  def show
    @team = FantasyTeam.find(params[:id])
  end
end
  