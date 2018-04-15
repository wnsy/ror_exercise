class AdminsController < ApplicationController
	before_action :authenticate_admin!

	def index
   @admins = Admin.all
	end

	def create
	end

	def new
		@admins = Admin.new
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
