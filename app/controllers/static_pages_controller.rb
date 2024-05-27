class StaticPagesController < ApplicationController
	require 'flickr'

	def index
		flickr = Flickr.new ENV['pusher_key'], ENV['pusher_secret']


		if params[:query].present?
			user = flickr.people.findByUsername(username:params[:query])
			@photos_list   = flickr.people.getPhotos(user_id: user.nsid)
		end
	end
end
