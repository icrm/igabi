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

require 'spec_helper'

describe DataFile do
  pending "add some examples to (or delete) #{__FILE__}"
end
