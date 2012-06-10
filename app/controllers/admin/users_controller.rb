# -*- coding: utf-8 -*-
class Admin::UsersController < Admin::AdminController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @alter_pass = true
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    user = User.new(params[:user])
    if user.save
      flash[:success] = "Usuário cadastrado com sucesso!"
      redirect_to admin_user_path(user)
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Usuário atualizado com sucesso!"
      redirect_to admin_user_path(@user)
    else
      render "edit"
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    flash[:success] = "Usuário excluído com sucesso!"
    redirect_to admin_users_path
  end
end
