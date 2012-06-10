# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: partners
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  short_description :string(255)
#  description       :binary
#  path_first_image  :string(255)
#  path_second_image :string(255)
#  active            :boolean
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  published_date    :date
#
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
