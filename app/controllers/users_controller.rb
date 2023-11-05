class UsersController < ApplicationController
  def delete_user
    @user = User.find(params[:format])
    @user.destroy

    redirect_to '/users/users_manager'
  end

  def update_user
    users = User.where(id: params[:format])

    users.each do |user|
      next if params[:user][:email].blank? && params[:user][:admin].blank?

      user.update(email: params[:user][:email], admin: params[:user][:admin])

      user.save!
    end

    redirect_to '/users/users_manager'
  end

  def users_manager
    @users ||= User.all
  end

  private

  def user_params
    params.permit(:id, :email, :admin)
  end
end

