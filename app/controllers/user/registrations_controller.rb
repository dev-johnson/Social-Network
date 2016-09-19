class User::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
before_filter :authenticate_user!
  # GET /resource/sign_up
  def show
    begin
      @user = User.find(params[:id])
      raise unless check_current_user @user
    rescue Exception => e
      flash[:notice] = "You can't do that."
      redirect_to "/"
    end
  end
  # def new
  #   super
  # end

  # POST /resource
  def create
    begin
    @user = User.create(user_params)
    sign_in(@user)
       AdminMailer.new_user_notification(@user).deliver
       AdminMailer.admin_notification(@user).deliver
         # user = @user
         # sign_in(@user)
        # cooies.permanent.signed[:remember_token] = [user.id, user.salt]
        # session[:current_user] = user
        # current_user = user
        # redirect_to after_sign_in_path(user)
         redirect_to "/"
    rescue Exception => e
       puts e.backtrace
       render nothing: true, status: 500
    end
         # @user = User.create(user_params)
         # redirect_to "/"
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   sign_in(:sign, user)
  #   redirect_to "/"
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
   def user_params
      params.require(:user).permit(:first_name, :last_name, :phone, :email, :image,:password,:password_confirmation)
    end


    def user_approval
      begin
        raise unless current_user.is_admin == "true"

            @id = params[:id]
            @user = User.find(@id)
            @user.approved = "true"
            @user.save
        redirect_to root_path
        flash[:alert] ="#{@user.first_name} has been approved....."

      rescue Exception => e
        redirect_to root_path
        flash[:notice] = "you are not authorized !!!! ...........  if you are the admin check for log"

      end
    end

    private
    def check_current_user user
      return true if current_user && (current_user.admin?)
      if (current_user && (current_user.id == user.id))
        return true
      else
        return false
      end
    end

end
