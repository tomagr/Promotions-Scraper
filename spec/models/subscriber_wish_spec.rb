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
	it { is_expected.to respond_to(:name) }
	it { is_expected.to respond_to(:claimed) }
	it { is_expected.to respond_to(:response) }

	it { is_expected.to respond_to(:subscriber) }
	it { is_expected.to belong_to(:subscriber) }
end
