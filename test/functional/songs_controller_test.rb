require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  setup do
    @song = songs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:songs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create song" do
    assert_difference('Song.count') do
      post :create, song: { album_150x150: @song.album_150x150, album_800x800: @song.album_800x800, album_title: @song.album_title, artist_name: @song.artist_name, duration: @song.duration, mnet_id: @song.mnet_id, title: @song.title }
    end

    assert_redirected_to song_path(assigns(:song))
  end

  test "should show song" do
    get :show, id: @song
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @song
    assert_response :success
  end

  test "should update song" do
    put :update, id: @song, song: { album_150x150: @song.album_150x150, album_800x800: @song.album_800x800, album_title: @song.album_title, artist_name: @song.artist_name, duration: @song.duration, mnet_id: @song.mnet_id, title: @song.title }
    assert_redirected_to song_path(assigns(:song))
  end

  test "should destroy song" do
    assert_difference('Song.count', -1) do
      delete :destroy, id: @song
    end

    assert_redirected_to songs_path
  end
end
