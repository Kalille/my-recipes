class SessionsController < ApplicationController
include CurrentUserConcern


    # def logged_in
        
    #     if @current_user
           
    #         render json: {
    #             logged_in: true,
    #             user: @current_user 
    #         }
       
    #     else 
    #         render json: {
    #             logged_in:false
    #         }
    #     end
      
    # end

    # def register
      
    #     # user = User.create(user_params)
    #     # user = User.create(first_name: params[:first_name], last_name: params[:last_name],password: params[:password], username: params[:username])
    #      user = new_user
    #     if user.valid?
    #         session[:user_id] = user.id
    #         render json: user, status: :created
    #     else 
    #         render json: {errors: user.errors.full_messages}, status: 500
    #     end
    #   end



#   def index
#     user = User.find(session[:user_id])
#     render json: user
#   end
    
#     def login

#         # user = User.find_by(user_params)
#         user = User.find_by(username: params[:username])
#         # user.authenticate(params[:password])
    
#         if user && user.authenticate(params[:password])
#         # if user
#             session[:user_id]= user.id
#             render json: user, status: :created
#         else
          
#             render json: {error: "invalid username or password"}, status: 401
          
#         end
  
#     end

    # def destroy
    #     session.delete :user_id
    #     byebug
    #     head :no_content
    # end

#     private

#     def user_params
#         params.require(:user).permit(:username)
#         # @user = User.find_by(username: params[:username])
#         # @user.authenticate(params[:password])
#     end

#     def new_user
#         @user = User.create(first_name: params[:first_name], 
#                               last_name: params[:last_name],
#                               password: params[:password], 
#                               username: params[:username],
#                               password_confirmation: params[:password_confirmation]
#                               )
#       end

# end
def create
    @user = User.find_by(username:params[:username])
  
    if @user && @user.authenticate(params[:password])
      login!
      render json: {
        logged_in: true,
        user: @user
      }
    else
      render json: { 
        status: 401,
        errors: ['no such user, please try again']
      }
    end

   
end
def show
    if logged_in? && current_user
      render json: {
        logged_in: true,
        user: current_user
      }
    else
      render json: {
        logged_in: false,
        message: 'no such user'
      }
    end
end
def destroy
  
    #   logout!
    session.delete :user_id
   
  
      render json: {
        status: 200,
        logged_out: true
      }
end
private
def session_params
     params.require(:user).permit(:username, :password)
end
end