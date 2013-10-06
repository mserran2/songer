class AddPlaylistIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :playlist_id, :integer, :after => :id
  end
end
