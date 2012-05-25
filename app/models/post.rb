# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  sumary     :binary
#  post       :binary
#  active     :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  user_id    :integer
#

class Post < ActiveRecord::Base
  attr_accessible :title, :sumary, :post, :active, :user_id

  # Relacionamentos
  belongs_to :user
end
