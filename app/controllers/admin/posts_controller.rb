# -*- coding: utf-8 -*-
class Admin::PostsController < Admin::AdminController
  before_filter :signed_in_user

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @post = Post.new
    @files = DataFile.paginate(page: params[:file_page], per_page: 6)
  end

  def edit
    @post = Post.find_by_id(params[:id])
    @files = DataFile.paginate(page: params[:file_page], per_page: 6)
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to admin_post_path(@post), success: "Noticia cadastrada com sucesso!"
    else
      render "new"
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to admin_post_path(@post), success: "Noticia atualizada com sucesso!"
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to admin_posts_path, sucess: "Notícia excluida com sucesso!"
  end
end
