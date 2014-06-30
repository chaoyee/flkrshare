class AuthenticationController < ApplicationController
  CALLBACK_URL = "http://127.0.0.1:3000/callback" if Rails.env.development?
  CALLBACK_URL = "http://____.herokuapp.com:3000/callback" if Rails.env.production?

  def user_login
    username = params[:username]
    user = flickr.people.findByUsername(username: username)
    session[:user_id]  = user["id"]
    session[:username] = username
    token = flickr.get_request_token(oauth_callback: CALLBACK_URL)
    Rails.cache.write("oauth_token", token['oauth_token'])
    Rails.cache.write("oauth_token_secret", token['oauth_token_secret'])
    session[:oauth_token]        = token['oauth_token']  
    session[:oauth_token_secret] = token['oauth_token_secret']
    auth_url = flickr.get_authorize_url(token['oauth_token'], :perms => 'read')
    redirect_to auth_url
  end

  def callback
    oauth_verifier = params[:oauth_verifier]
    begin
      @access_token = flickr.get_access_token(Rails.cache.read("oauth_token"), Rails.cache.read("oauth_token_secret"), oauth_verifier)      
      # @access_token = flickr.get_access_token(session[:oauth_token], session[:oauth_token_secret], oauth_verifier)      
      flash[:success] = "This application already has permission from Flickr to access #{@access_token["username"]}'s original size photos."
      redirect_to photosets_path
    rescue FlickRaw::FailedResponse => e
      flash[:error] =  "Authentication failed : #{e.msg}"
      redirect_to root_path
    end 
  end
end