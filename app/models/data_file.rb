# == Schema Information
#
# Table name: data_files
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  path        :string(255)
#  file_type   :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  mime_type   :string(255)
#  description :string(255)
#

class DataFile < ActiveRecord::Base
  attr_accessible :file_type, :name, :path, :mime_type, :description

  before_save :identify_file_type

  # Tipos de Arquivos
  APPLICATION = 1 # .doc, .pdf, .docx, etc.
  AUDIO       = 2
  EXAMPLE     = 3
  IMAGE       = 4
  MESSAGE     = 5
  MODEL       = 6
  MULTIPART   = 7
  TEXT        = 8
  VIDEO       = 9

  # Mime Types
  APPLICATION_MIMETYPE = ["application/pdf", "application/msword", "application/x-shockwave-flash"]
  IMAGE_MIMETYPE       = ["image/gif", "image/jp2", "image/jpeg", "image/png", "image/bmp", "image/x-icon"]
  VIDEO_MIMETYPE       = ["video/mpeg", "video/jpeg", "video/mp4"]
  TEXT_MIMETYPE        = ["text/html"]

  def file= (f)
    @file = f
  end

  def application?
    self.file_type == APPLICATION
  end

  def audio?
    self.file_type == AUDIO
  end

  def example?
    self.file_type == EXAMPLE
  end

  def image?
    self.file_type == IMAGE
  end

  def message?
    self.file_type == MESSAGE
  end

  def model?
    self.file_type == MODEL
  end

  def multipart?
    self.file_type == MULTIPART
  end

  def text?
    self.file_type == TEXT
  end

  def video?
    self.file_type == VIDEO
  end

  private

    def identify_file_type
      if APPLICATION_MIMETYPE.include?(self.mime_type)
        self.file_type = APPLICATION
      end

      if IMAGE_MIMETYPE.include?(self.mime_type)
        self.file_type = IMAGE
      end

      if VIDEO_MIMETYPE.include?(self.mime_type)
        self.file_type = VIDEO
      end

      if TEXT_MIMETYPE.include?(self.mime_type)
        self.file_type = TEXT
      end
    end
end
