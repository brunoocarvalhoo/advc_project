class UsersController < ApplicationController
  def delete_user
    @user = User.find(params[:format])
    @user.destroy

    redirect_to '/users/users_manager'
  end

  def update_user
    users = User.where(id: params[:format])

    users.each do |user|
      next if user_params[:email].blank? && user_params[:admin].blank?

      user.update(user_params)

      user.save!
    end

    if current_user.admin?
      redirect_to '/users/users_manager'
    else
      redirect_to '/'
    end
  end

  def users_manager
    @users ||= User.all
  end

  private

  def user_params
    params[:user].permit(:id, :email, :admin)
  end
end

