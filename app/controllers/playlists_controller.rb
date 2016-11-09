class PlaylistsController < ApplicationController
  def create
    playlist = Playlist.create(user: current_user, song_id: params[:song_id])
    redirect_to :back
  end
end
