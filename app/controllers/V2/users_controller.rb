class V2::UsersController < ApplicationController
  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password]
    )
    if user.save
      render json: { status: 'User created' }
    else
      render json: { error: user.errors.full_messages }
    end
  end
end
