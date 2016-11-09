class Song < ActiveRecord::Base
  belongs_to :user
  has_many :playlists, dependent: :destroy
  has_many :users_playlist, through: :playlists, source: :user
  validates :title, :artist, presence:true, length: {minimum: 2}
end
