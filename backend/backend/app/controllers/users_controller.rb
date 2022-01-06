class UsersController < ApplicationController
    
    def index
        render json: User.all, include: [:recipes]
  
      end

      def create
      
        # user = User.create(user_params)
        # user = User.create(first_name: params[:first_name], last_name: params[:last_name],password: params[:password], username: params[:username])
         user = new_user
       
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else 
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
      end

      def show
        # user = user_id_params
        @user = User.find_by(id: session[:user_id])
       
        # if @user
        render json: @user
        # else 
        #     render json: {error: "not authorized"}, status: :unauthorized
        # end
      end

      private
      def user_id_params
        @user = User.find_by(id: session[:user_id])
      end
      def user_params
        params.require(:user).permit(:first_name,:last_name,:password,:username, :password_confirmation)
      end

      def new_user
        @user = User.create(first_name: params[:first_name], 
                              last_name: params[:last_name],
                              password: params[:password], 
                              username: params[:username],
                              password_confirmation: params[:password_confirmation]
                              )

      end
end
