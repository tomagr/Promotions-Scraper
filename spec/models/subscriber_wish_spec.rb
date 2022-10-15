# == Schema Information
#
# Table name: subscriber_wishes
#
#  id            :bigint           not null, primary key
#  claimed       :boolean          default(FALSE)
#  name          :string(255)      not null
#  response      :text(65535)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  subscriber_id :bigint           not null
#
# Indexes
#
#  index_subscriber_wishes_on_subscriber_id  (subscriber_id)
#
require 'rails_helper'

RSpec.describe SubscriberWish, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
