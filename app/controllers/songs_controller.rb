class SongsController < ApplicationController
  before_filter :getPlaylist
  before_filter :getSong, :only => [:show, :edit, :update, :destroy]

  def index
    @songs = @playlist.songs

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.json
  def new
    @song = @playlist.songs.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = @playlist.songs.build(params[:song])

    respond_to do |format|
      if @song.save
        format.html { redirect_to playlist_song_path(@playlist,@song), notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: playlist_song_path(@playlist,@song) }
      else
        format.html { render action: 'new' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to playlist_song_path(@playlist,@song), notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy

    respond_to do |format|
      format.html { redirect_to playlist_songs_url(@playlist) }
      format.json { head :no_content }
    end
  end

  def getPlaylist
    @playlist = Playlist.find(params[:playlist_id])
  end

  def getSong
    @song = @playlist.songs.find(params[:id])
  end
end
