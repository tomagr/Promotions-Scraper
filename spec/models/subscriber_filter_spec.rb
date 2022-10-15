# == Schema Information
#
# Table name: subscriber_filters
#
#  id            :bigint           not null, primary key
#  name          :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  subscriber_id :bigint           not null
#
# Indexes
#
#  index_subscriber_filters_on_subscriber_id  (subscriber_id)
#

require 'rails_helper'

RSpec.describe SubscriberFilter, type: :model do

  it { should respond_to(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(255) }

  it { should respond_to(:subscriber) }
  it { should belong_to(:subscriber) }
	
end
