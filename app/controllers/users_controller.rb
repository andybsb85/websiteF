class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def new
		@user = User.new
	end

	def index
		@user= User.find(:all)
	end

	def show
		@user = User.find(params[:id])
	  
  end
	end

	def create 
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "User succesfully created"
			redirect_to @user
		else
			render action: 'new'
		end
	end

	def update
		super
	end

	def destroy
		@user.destroy
		redirect_to users_url, notice: 'User was successfully destroyed.'
	end


end
