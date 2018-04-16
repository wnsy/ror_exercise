class BusinessesController < ApplicationController
	require 'open-uri'
	before_action :authenticate_business!

	def index
		@businesses = Business.all #delete later / @todo: associate with admin model to show all users?
		#@todo: put in a list
		encoded_url = URI.encode("https://api.iextrading.com/1.0/stock/#{params[:id]}/price") #{@stock}/price")
		if params[:id] == ''
			@empty = 'Must enter a symbol.'
		elsif

			if params[:id]
				begin
					@stock = parse_uri(open(URI.parse(encoded_url)).read)
				rescue StandardError
					@error = "The stock symbol doesn't exist."
				end

			end
		end
	end

	def create
		#create a stock list (named list)
		#puts "The Apple stock price is #{open(URI.parse(encoded_url)).read}$USD"
	end

	def new
	end

	def show
	end

	def update
	end

	def edit
	end

	def destroy
	end

end
