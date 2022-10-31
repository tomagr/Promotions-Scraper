# == Schema Information
#
# Table name: entries
#
#  id          :integer          not null, primary key
#  available   :boolean          default(FALSE)
#  email_sent  :boolean          default(FALSE)
#  featured    :boolean          default(FALSE)
#  released_at :datetime
#  status      :string(255)
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  site_id     :integer
#

require 'rails_helper'

RSpec.describe Entry, type: :model do

	it { should respond_to(:title) }
	it { should validate_presence_of(:title) }

	it { should respond_to(:site_id) }
	it { should validate_uniqueness_of(:site_id) }

	it { should respond_to(:status) }
	it { should respond_to(:released_at) }
	it { should respond_to(:email_sent) }
	it { should respond_to(:available) }

	describe '#create!' do
		context 'with correct params' do

			let(:valid_entry) { create(:entry) }
			it { expect(valid_entry).to be_valid }

		end

	end

end
