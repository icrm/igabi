# -*- coding: utf-8 -*-
class Admin::SessionsController < Admin::AdminController

  # Define o layout a ser utilizado
  # app_root/app/views/layouts/admin/login.html.erb
  layout "admin/login"

  def new
    # app_root/app/views/layouts/admin/sessions/new.html.erb
    user = current_user
    if user
      sign_in user
      redirect_back_or admin_home_path
    end
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or admin_home_path
    else
      flash.now[:error] = 'Usuário e/ou Senha inválidos!'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to admin_root_path
  end
end
