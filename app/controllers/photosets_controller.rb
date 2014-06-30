class PhotosetsController < ApplicationController
  def index
    # user_id = flickr.people.findByUsername(username: current_user)
    @photosets = flickr.photosets.getList(user_id: session[:user_id])
  end
end
