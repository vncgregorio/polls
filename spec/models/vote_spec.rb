# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  option_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:vote) { build(:vote) }

  it 'is valid with valid attributes' do
    expect(vote).to be_valid
  end

  it 'is not valid without an option' do
    vote.option = nil
    expect(vote).not_to be_valid
  end

  describe "associations" do
    it { should belong_to(:option) }
  end
end
