# -*- coding: utf-8 -*-
class Admin::UploadsController < Admin::AdminController
  before_filter :signed_in_user

  def index
    @files = DataFile.all
  end

  def create
    to_up = params[:upload]
    file = DataFile.new
    file.name        = to_up['file_name']
    file.description = to_up['file_description']
    file.mime_type   = file_mime_type(to_up['datafile'].original_filename)
    file.path        = write_file(to_up['datafile'])
    file.save
    redirect_to admin_uploads_path
  end

  def destroy
    file = DataFile.find(params[:id])
    file.destroy

    redirect_to admin_uploads_path
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

    def write_file(upload)
      name = upload.original_filename
      directory = "public/data"
    
      # Define o caminho do arquivo
      path = File.join(directory, name)
      public_path = File.join("data", name)

      # Escreve o arquivo
      File.open(path, "wb") { |f| f.write( upload.read ) }
      return public_path
    end

    def file_mime_type(filename)
      extname = File.extname(filename)[1..-1]
      mime_type = Mime::Type.lookup_by_extension(extname)
      content_type = mime_type.to_s unless mime_type.nil?
    end
end
