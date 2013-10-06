class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :mnet_id
      t.string :title
      t.string :artist_name
      t.string :album_title
      t.string :duration
      t.string :album_150x150
      t.string :album_800x800

      t.timestamps
    end
  end
end
