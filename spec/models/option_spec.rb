# == Schema Information
#
# Table name: options
#
#  id          :bigint           not null, primary key
#  poll_id     :integer
#  number      :integer
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Option, type: :model do
  let(:option) { build(:option) }

  it 'is valid with valid attributes' do
    expect(option).to be_valid
  end

  it 'is not valid without a description' do
    option.description = nil
    expect(option).not_to be_valid
  end

  describe "associations" do
    it { should belong_to(:poll) }
    it { should have_many(:votes) }
  end
end
