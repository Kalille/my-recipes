class RegistrationController < ApplicationController

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
        user = user_id_params

        # if user
        render json: user, except: [:created_at,:updated_at]
        # else 
        #     render json: {error: "not authorized"}, status: :unauthorized
        # end
      end


      private

      def new_user
        @user = User.create(first_name: params[:first_name], 
                              last_name: params[:last_name],
                              password: params[:password], 
                              username: params[:username],
                              password_confirmation: params[:password_confirmation]
                              )

      end
end
