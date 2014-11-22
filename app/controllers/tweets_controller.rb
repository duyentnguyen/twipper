class TweetsController < ApplicationController
	def new
		#creates new instance of the object Tweet
		#'@' -> means the view has an access to the variable
		@tweet = Tweet.new
	end

	# create doesn't have access to the object Tweet since it's not defined here
	def create
		#saves it to database
		@tweet = Tweet.create(tweet_params)
		flash[:success] = "You have successfully created a Tweet!"
		#it doesn't need to be rendered on a new page -> just on the same page as the form, the new page
		render 'new'
	end

	def tweet_params
		#requires the tweet object and only takes in the tweet string
		params.require(:tweet).permit(:tweet)
	end
end
