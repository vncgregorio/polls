# == Schema Information
#
# Table name: views
#
#  id         :bigint           not null, primary key
#  poll_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe View, type: :model do
  let(:view) { build(:view) }

  it 'is valid with valid attributes' do
    expect(view).to be_valid
  end

  it 'is not valid without a poll' do
    view.poll = nil
    expect(view).not_to be_valid
  end

  describe "associations" do
    it { should belong_to(:poll) }
  end
end
