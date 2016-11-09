class User < ActiveRecord::Base
  has_secure_password
  has_many :songs
  has_many :playlists, dependent: :destroy
  has_many :songs_playlist, through: :playlists, source: :song
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, :email, presence:true
  validates :password, length: {minimum: 8}, on: :create
  validates :email, uniqueness: {case_sensitive: false}, format:{with:email_regex}
end
