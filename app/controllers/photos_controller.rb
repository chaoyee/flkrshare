class PhotosController < ApplicationController
  def index
    photoset_id = params[:id]
    photos_hash = flickr.photosets.getPhotos(photoset_id: photoset_id, extra: "original_format")
    @total_number_of_photos = photos_hash.total
    @photoset_title = photos_hash.title
    @photos_array = photos_hash.photo    # extract the elements of key "photo" belongs to the photoset as an array
    add_isselected_to_photos_array
    Rails.cache.write("photos_array", @photos_array.to_a) # transform from FlickRaw::Response to array, and write to cache 
  end

  def show
    @photos_array  = Rails.cache.read("photos_array")
  end

  private

  def add_isselected_to_photos_array
    @photos_array.each {|h| h.to_hash["isselected"] = false } # h.class => FlickRaw::ResponseList, .to_hash transform to hash. 
  end

end    