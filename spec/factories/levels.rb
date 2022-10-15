# == Schema Information
#
# Table name: levels
#
#  id         :bigint           not null, primary key
#  clue       :string(255)
#  code       :string(255)
#  priority   :integer
#  solved     :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :level do
    
  end
end
