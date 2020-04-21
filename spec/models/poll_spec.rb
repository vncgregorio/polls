# == Schema Information
#
# Table name: polls
#
#  id          :bigint           not null, primary key
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Poll, type: :model do
  let(:poll) { build(:poll) }

  it 'is valid with valid attributes' do
    expect(poll).to be_valid
  end

  it 'is not valid without a description' do
    poll.description = nil
    expect(poll).not_to be_valid
  end

  describe "associations" do
    it { should have_many(:options) }
    it { should have_many(:views) }
  end
end
