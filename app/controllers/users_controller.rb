class UsersController < ApplicationController
  allow_unauthenticated_access

  def index
    @users = User.all
  end

  def new
    @user= User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Usuario Creado"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def user_params
    params.expect(user: [:username, :email_address, :password, :password_confirmation])
  end


end
