class SessionsController < ApplicationController
  
  def new
    if logged_in?
      flash[:info] = 'すでにログインしています。'
      redirect_to current_user
    end
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = 'ログインしました。'
      redirect_to user
    else
      flash.now[:danger] = '認証に失敗しました。'
      render :new
    end
  end
  
  def destroy
    log_out if logged_in?
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private
end





# class SessionsController < ApplicationController

#   def new
#   end

#   def create
#     user = User.find_by(email: params[:session][:email].downcase)
#     if user && user.authenticate(params[:session][:password])
#       log_in user
#       params[:session][:remember_me] == '1' ? remember(user) : forget(user)
#       redirect_back_or user
#     else
#       flash.now[:danger] = '認証に失敗しました。'
#       render :new
#     end
#   end

#   def destroy
#     # ログイン中の場合のみログアウト処理を実行します。
#     log_out if logged_in?
#     flash[:success] = 'ログアウトしました。'
#     redirect_to root_url
#   end
# end


# class SessionsController < ApplicationController

#   def new
#   end

#   def create
#     user = User.find_by(email: params[:session][:email].downcase)
#     if user && user.authenticate(params[:session][:password])
#       log_in user
#       redirect_to user
#     else
#       flash.now[:danger] = '認証に失敗しました。'
#       render :new
#     end
#   end

#   def destroy
#     log_out
#     flash[:success] = 'ログアウトしました。'
#     redirect_to root_url
#   end
# end







# class SessionsController < ApplicationController

#   def new
#   end

#   def create
#     user = User.find_by(email: params[:session][:email].downcase)
#     if user && user.authenticate(params[:session][:password])
#       log_in user
#       redirect_to user
#     else
#       flash.now[:danger] = '認証に失敗しました。'
#       render :new
#     end
#   end

  
#   def destroy
#     log_out if logged_in?
#     flash[:success] = 'ログアウトしました。'
#     redirect_to root_url
#   end
# end
