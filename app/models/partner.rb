# -*- coding: utf-8 -*-
class Partner < ActiveRecord::Base
  attr_accessible :active, :description, :name, :path_first_image, :path_second_image, :short_description, :published_date

  before_save :set_pub_date

  def published?
    if self.active
      return "Sim"
    else
      return "Não"
    end
  end

  private

    def set_pub_date
      if !self.active.nil? && self.active
        time = Time.new
        self.published_date = time.to_date
      end
    end
end
