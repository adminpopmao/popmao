class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  include ApplicationHelper

  layout "show_topic"

  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default :root
    else
      render :action => 'new'
    end
  end

  def welcome
  end

  def check_user_name
    @users = User.find(:all, :conditions => " login ='" + params[:login] + "'")
    if @users.size > 0
      render :js => "set_error_info($('user_login'),'用户名已经被使用！');"
    else
      render :js => "set_pass_info($('user_login'));"
    end
  end

  def check_user_email
    @users = User.find(:all, :conditions => "email='#{params[:email]}'")
    if @users.size > 0
      render :js => "set_error_info($('user_email'),'该邮箱已经被使用！');"
    else
      render :js => "set_pass_info($('user_email'));"
    end
  end
end

