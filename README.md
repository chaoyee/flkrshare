### Making a Flickr sharing utility using Flickr API
-----------------
Flickr is a well-known photo sharing service. I have used it since 2006. It's a stable, easy to use and powerful site for sharing my photography. Further more, I used Flickr as a photo bed to serve the photos to my blog site. It's a perfect match for saving space of my blog web site as well as better performance.

Since I am a photographer, I always like to put many photos in one article. That make me feel troublesome since I have to copy the shared urls of each photo and paste it to the html file of the article manually. If I have 20 photos in that photoset, I have to do it 20 times. It's really a nightmare.

Therefore, I decide to find some utilities to help me do the job. I have found [quickr pickr](http://quickrpickr.com/) is quite helpful which can generate a HTML file from the selected photos.  However, I can not find a way to select photos from a certain photoset. I decide to build my own utility web to solve this problem. 

Firstly, I visit [Flickr API web site](https://www.flickr.com/services/api/) to study how to utilize the Flickr APIs. I also found some gems of Ruby wrapper such as [flickr_fu](https://github.com/commonthread/flickr_fu), [flickraw](https://github.com/hanklords/flickraw) and more. I tried flickr_fu first because I found this article ["Integrating Flickr into your rails website"](http://www.pixellatedvisions.com/2009/04/06/integrating-flickr-into-your-rails-website). There are detailed explainations of how to use the wrapper and get the photos shown on the web pages. However, I got stuck while I tried to call the wrapper. There was a message: "95: SSL is required, SSL is required to access the Flickr API." It is because of this article on the Flickr Blog: ["Flickr API Going SSL-Only on June 27th, 2014"](http://code.flickr.net/2014/04/30/flickr-api-going-ssl-only-on-june-27th-2014/). Flickr API does not allow non-SSL connections any more. Well, flickr_fu is not support SSL. It is time to change another wrapper.

["flickraw"](http://hanklords.github.io/flickraw/) is quite promising since it supports SSL. I found it is extremly easy to use. Also, developers can save times because there are many handy helpers to use. 

After a hard working time, **[flkrshare](https://github.com/chaoyee/flkrshare)** is releasing!

The **[flkrshare](https://github.com/chaoyee/flkrshare)** application is a flickr sharing urls generator. 

It starts from getting a valid flickr user. Flickr will ask for the permission to read the original size of the photos and then show all photosets owned by the user.  It will generate the sharing urls of all photos after user choose one photoset.  The users just copy the sharing urls, paste to their blog html editors and starts to write article.

#### The Techniques used:

* flickr APIs wrapped by flickraw
* Bootstrap 3 for responsive web design

#### Steps to operate

1. input a valid flickr user name.
2. give permission on flickr page.
3. select the photoset.
4. review the photos.
5. generate the sharing urls.