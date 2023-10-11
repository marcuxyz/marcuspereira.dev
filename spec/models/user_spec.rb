require 'rails_helper'

RSpec.describe User, type: :model do
  context 'presence' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }

    context 'associations' do
      it { should have_one(:profile) }
    end
  end
end
