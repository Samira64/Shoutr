class UsersController < Clearance::UsersController
def create
	@user= User.new(user_params)
	if @user.save
		redirect_to root_path
	end
end

def new
	@user = User.new
end

private
def user_params
	params.require(:user).permit(:username, :email, :password)
end

end
