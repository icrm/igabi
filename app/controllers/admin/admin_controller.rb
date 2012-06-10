# -*- coding: utf-8 -*-
class Admin::AdminController < ActionController::Base
  protect_from_forgery
  include Admin::SessionsHelper
  include Admin::AdminHelper

  private

    # Verifica se existe algum usuário logado, caso contrario direciona para
    # a pagina de login
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to admin_root_path, notice: "Por favor, faça login"
      end
    end

    def write_file(u)
      # Recupera a extensao do arquivo
      ex = File.extname(u.original_filename)
      # Recupera o nome do arquivo sem a extensao
      nm = sanitize_filename(u.original_filename, ex)
      # Data e Hora atuais
      dt = Time.new
      # Timestamp para que os nomes de arquivos sejam diferentes
      ts = dt.to_time.to_i
      # Diretorio onde os arquivos serão salvos
      d = "public/data"
      
      fn = nm + "_" + ts.to_s + ex
    
      # Define o caminho do arquivo
      p = File.join(d, fn)
      pp = File.join("data", fn)

      # Escreve o arquivo
      File.open(p, "wb") { |f| f.write( u.read ) }
      return pp
    end

    def sanitize_filename(file_name, extension)
      # get only the filename, not the whole path (from IE)
      just_filename = File.basename(file_name, extension)
      just_filename.gsub(/[^\w\.\-]/, "")
    end

    def file_mime_type(filename)
      extname = File.extname(filename)[1..-1]
      mime_type = Mime::Type.lookup_by_extension(extname)
      content_type = mime_type.to_s unless mime_type.nil?
    end
end
