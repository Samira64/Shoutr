class SessionsController < Clearance::SessionsController
def create
	@user = authenticate(params)

	sign_in(@user) do |status|
		if status.success?
			redirect_to root_path
		else
			flash.now.notice = status.failure_message
			render template: "sessions/new", status: :unauthorized
		end
	end
end

def destroy
	sign_out
	redirect_to url_after_destroy
end

private

def authenticate(_)
	super(session_params)
end

def session_params
	{session: session_params_with_email}
end

def session_params_with_email
	params.
	require(:session).
	permit(:password,:email_or_username).
	merge(email: user.email)
end

def user
	User.where(email: email_or_username).or(User.where(username: email_or_username)).first || Guest.new
end 

def email_or_username
	params[:session][:email_or_username]
end
end