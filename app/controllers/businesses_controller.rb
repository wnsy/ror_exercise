class BusinessesController < ApplicationController
	require 'open-uri'
	before_action :authenticate_business!

	def index
		@businesses = Business.all
		#this should show a stock list (named list of stock tickers)
	end

	def create
		#create a stock list (named list)
	end

	def new
		puts "The Apple stock price is #{open('https://api.iextrading.com/1.0/stock/AAPL/price').read}$USD"
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
