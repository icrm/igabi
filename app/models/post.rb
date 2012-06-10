# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: posts
#
#  id             :integer         not null, primary key
#  title          :string(255)
#  sumary         :binary
#  post           :binary
#  active         :boolean
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  user_id        :integer
#  published_date :date
#

class Post < ActiveRecord::Base
  attr_accessible :title, :sumary, :post, :active, :user_id, :published_date

  before_save :set_pub_date

  # Relacionamentos
  belongs_to :user

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
