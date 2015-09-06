class SeasonsController < ApplicationController
  def create
    @show = Show.find(params[:show_id])
    @season = @show.seasons.create(season_params)
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
      params.require(:season).permit(:number, :num_episodes, :watched)
    end
end
