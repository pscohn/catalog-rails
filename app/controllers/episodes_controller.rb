class EpisodesController < ApplicationController
  def update
    @show = Show.find(params[:show_id])
    @episode = Episode.find(params[:id])
    if @episode.watched
      @episode.watched = false
    else
      @episode.watched = true
    end
    @episode.save
    redirect_to :back
  end

  def season_params
    params.require(:episode).permit(:watched)
  end
end
