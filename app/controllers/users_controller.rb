class UsersController < ApplicationController
  def create
    user = User.new user_params
    if user.save
      render json: {
        message:"Signed Up successfully",
        is_success:true,
        data: {
          user: user
        }
      },status: :ok
    else
      render json: {
        message:"Some thing wrong",
        is_success:false,
        data: {}
      },status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end
  def ensure_params_exist
    render json: {
      message:"missing params",
      is_success:false,
      data: {}
    },status: :bad_request
    end
end
