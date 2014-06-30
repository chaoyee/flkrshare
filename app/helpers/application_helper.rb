module ApplicationHelper
  # def get_total_in_a_photoset(photosets, photoset_id)
  #   photosets.getPhotos(photoset_id: photoset_id).total
  # end

  # Photo Source URLs

  # The URL takes the following format:
  
  # http://farm{farm-id}.staticflickr.  com/{server-id}/{id}_{secret}.jpg
  #   or
  # http://farm{farm-id}.staticflickr.  com/{server-id}/{id}_{secret}_[mstzb].jpg
  #   or
  # http://farm{farm-id}.staticflickr.  com/{server-id}/{id}_{o-secret}_o.( jpg|gif|png)
  # * Before November 18th, 2011 the API  returned image URLs with hostnames like:   "farm{farm-id}.static.flickr.com". Those  URLs are still supported.
  
  # Size Suffixes
  
  # The letter suffixes are as follows:
  
  # s small square 75x75
  # q large square 150x150
  # t thumbnail, 100 on longest side
  # m small, 240 on longest side
  # n small, 320 on longest side
  # - medium, 500 on longest side
  # z medium 640, 640 on longest side
  # c medium 800, 800 on longest side†
  # b large, 1024 on longest side*
  # o original image, either a jpg, gif or  png, depending on source format

  WIDTH = '1024' # 720
  HEIGHT = '' # 480

  def generate_image_source(is_photoset, photo)
    # photo is a hash
    
    set_elements(is_photoset, photo)
    src  = "http://farm#{@farm}.static.flickr.com/#{@server}/#{@id}_#{@secret}#{@size}.jpg"
  end

  def generate_share_string(photo)
    set_elements(false, photo)
    shared_string = "<a herf='https://www.flickr.com/photos/chaoyee/#{@id}' title='#{@title}'><img src='https://farm#{@farm}.static.flickr.com/#{@server}/#{@id}_#{@secret}#{@size}.jpg' width=#{WIDTH} height=#{HEIGHT} alt='#{@title}'></a>"
  end

  private

  def set_elements(is_photoset, photo)
    # is_photoset    = photo['id'].length == 10 ? false : true

    @server        = photo["server"]
    @farm          = photo["farm"]
    @id            = is_photoset ? photo["primary"] : photo["id"]
    @secret        = photo["secret"]
    @title         = photo["title"] 
    @size          = is_photoset ? "_s"        : "_z"  
  end

end
