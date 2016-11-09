class SongsController < ApplicationController
  before_action :require_login
  def create
    user = User.find(session[:user_id])
    song = Song.create(title: params[:title], artist: params[:artist], user_id: user.id)
    if song.save
      redirect_to '/songs'
    else
      flash[:messages] = ["Couldnt create song"]
      redirect_to :back
    end
  end
  def show
    @song = Song.find(params[:id])
    # @song = Song.all.joins("LEFT JOIN 'playlists' ON playlists.song_id = songs.id").group("playlists.song_id")
    @playlist = Playlist.where(song_id: params[:id])
    # @playlist = Playlist.all

  end
end
