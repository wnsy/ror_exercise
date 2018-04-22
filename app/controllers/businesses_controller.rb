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

end
