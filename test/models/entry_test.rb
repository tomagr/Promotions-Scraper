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

require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
