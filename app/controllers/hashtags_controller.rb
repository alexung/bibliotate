class HashtagsController < ApplicationController
	def index
		# This should be revised to avoid duplicate hashtags
		@hashtags = Hashtag.all
	end

	def show
		hashtag = Hashtag.find(params[:id])
		@hashtags = Hashtag.where(tag: hashtag.tag).first(5)
	end
end
