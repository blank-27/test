class SignupController < ApplicationController

   def create
      @newUser = User.new
   end

   def new
      if params[:user][:password] != params[:user][:password_confirmation]
         flash[:danger] = "Password does not match!"
         redirect_to signup_path
      elsif params[:user][:password].length < 8
         flash[:danger] = "Weak Password"
         redirect_to signup_path
      else 
         @newUser = User.new(user_params)
         if @newUser.save
            flash[:success] = "Account Created.Please log In :)"
            # @user = @newUser
            @newUser.profile = Profile.new #save default
            redirect_to login_path
         else
            flash[:errors] = "Try Again.Email Already Taken"
            redirect_to signup_path
         end
      end
   end

   private

      def user_params
         params.require(:user).permit(:name,:email,:password,:password_confirmation)
      end

end
