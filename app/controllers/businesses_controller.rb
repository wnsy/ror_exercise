class BusinessesController < ApplicationController
	before_action :authenticate_business!

	def index
		@businesses = Business.all
	end

	def create
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

	private
	# Never trust parameters from the scary internet, only allow the white list through.
  	def business
	  	params.require(:business).permit(:email, :password, :password_confirmation)
  	end

	end
