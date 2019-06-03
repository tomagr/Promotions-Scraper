
require 'rails_helper'

RSpec.describe User, type: :model do

  it { should respond_to(:email) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { should validate_length_of(:email).is_at_most(255) }

  describe '#create!' do
    context 'with correct params' do

      let(:valid_user) { create(:user) }
      it { expect(valid_user).to be_valid }

    end

    context 'without name' do
      let(:invalid_user) { create(:user_without_name) }
      it { expect { invalid_user }.to raise_exception(ActiveRecord::RecordInvalid) }
    end

    context 'without email' do
      let(:invalid_user) { create(:user_without_email) }
      it { expect { invalid_user }.to raise_exception(ActiveRecord::RecordInvalid) }
    end

  end

end
