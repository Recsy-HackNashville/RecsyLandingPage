class OmniauthCallbacksController < Devise::OmniauthCallbacksController   

    def linkedin
<<<<<<< HEAD
        auth = request.env["omniauth.auth"]
=======
        auth = env["omniauth.auth"]
>>>>>>> aebf6910fde7b673bf09dccd86fc66a5fc152d54
        @user = User.connect_to_linkedin(request.env["omniauth.auth"], current_user)
        if @user.persisted?
            flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
            sign_in_and_redirect @user, event: :authentication
        else
            session["devise.linkedin_uid"] = request.env["omniauth.auth"]
            redirect_to new_user_registration_url
        end
    end
end
