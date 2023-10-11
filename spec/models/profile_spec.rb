require 'rails_helper'

RSpec.describe Profile, type: :model do
  context 'presence' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  context 'associations' do
    it { should belong_to(:user) }
  end

  context '#fullname' do
    let(:profile) { create(:profile, first_name: 'Vivian', last_name: 'De Jesus Almeida Pereira') }

    it { expect(profile.fullname).to eq 'Vivian De Jesus Almeida Pereira' }
  end
end
