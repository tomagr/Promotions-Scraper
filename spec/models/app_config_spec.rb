# == Schema Information
#
# Table name: app_configs
#
#  id         :bigint           not null, primary key
#  slug       :string(255)      not null
#  value      :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe AppConfig, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
