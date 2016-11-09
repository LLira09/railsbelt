class UsersController < ApplicationController
  before_action :require_login, except: [:index, :create]
  def index
  end

  def dashboard
    @user = User.find(session[:user_id])
    @song = Song.all.joins("LEFT JOIN 'playlists' ON playlists.song_id = songs.id").group("playlists.song_id")

  end
  def show
    @user = User.find(params[:id])
    @song = Song.all.joins("LEFT JOIN 'playlists' ON playlists.song_id = songs.id").group("playlists.song_id")

  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/songs'
    else
      flash[:messages] = user.errors.full_messages
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
