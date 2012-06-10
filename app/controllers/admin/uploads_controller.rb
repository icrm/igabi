# -*- coding: utf-8 -*-
class Admin::UploadsController < Admin::AdminController
  before_filter :signed_in_user

  def index
    @files = DataFile.all
  end

  def show
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

    if !file.path.nil?
      p = File.join("public", file.path)
      File.delete(p) if File.exist?(p)
    end

    file.destroy

    redirect_to admin_uploads_path
  end
end
