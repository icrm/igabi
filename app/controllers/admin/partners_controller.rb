# -*- coding: utf-8 -*-
class Admin::PartnersController < Admin::AdminController
  before_filter :signed_in_user

  def index
    @partners = Partner.all
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new
    @partner.name = params[:partner]['name']
    @partner.path_first_image = write_file(params[:partner]['first_image'])
    @partner.short_description = params[:partner]['short_description']
    @partner.path_second_image = write_file(params[:partner]['second_image'])
    @partner.description = params[:partner]['description']
    @partner.active = params[:partner]['active']

    if @partner.save
      redirect_to admin_partner_path(@partner), success: "Parceiro cadastrada com sucesso!"
    else
      render "new"
    end
  end

  def show
    @partner = Partner.find(params[:id])
  end

  def edit
    @partner = Partner.find(params[:id])
  end

  def update
    @partner = Partner.find(params[:id])

    if @partner.update_attributes(params[:partner])
      redirect_to admin_partner_path(@partner), success: "Parceiro atualizado com sucesso!"
    else
      render "edit"
    end
  end

  def destroy
    partner = Partner.find(params[:id])
    
    if !partner.path_first_image.nil?
      p1 = File.join("public", partner.path_first_image)
      File.delete(p1) if File.exist?(p1)
    end
    if !partner.path_second_image.nil?
      p2 = File.join("public", partner.path_second_image)
      File.delete(p2) if File.exist?(p2)
    end

    partner.destroy
    redirect_to admin_partners_path, sucess: "Notícia excluida com sucesso!"
  end
end
