class Song < ActiveRecord::Base
  attr_accessible :album_150x150, :album_800x800, :album_title, :artist_name, :duration, :mnet_id, :title
  belongs_to :playlist
end
