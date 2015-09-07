class SeasonsController < ApplicationController
  def create
    @show = Show.find(params[:show_id])
    @season = @show.seasons.create(season_params)
    if params[:number_of_episodes] != ""
      num = params[:number_of_episodes].to_i
      num.times do |i|
        @season.episodes.create(number: i+1, watched: false)
      end
    end
    redirect_to show_path(@show)
  end

  def destroy
    @show = Show.find(params[:show_id])
    @season = @show.seasons.find(params[:id])
    @season.destroy
    redirect_to show_path(@show)
  end

  private
    def season_params
      params.require(:season).permit(:number)
    end
end
