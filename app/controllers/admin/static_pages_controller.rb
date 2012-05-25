# -*- coding: utf-8 -*-
class Admin::StaticPagesController < Admin::AdminController
  before_filter :signed_in_user

  def show
  end

  private

    # Verifica se existe algum usuário logado, caso contrario direciona para
    # a pagina de login
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to admin_root_path, notice: "Por favor, faça login"
      end
    end
end
