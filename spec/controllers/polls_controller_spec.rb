require 'rails_helper'

RSpec.describe PollsController, type: :controller do
  render_views

  let!(:poll) { create(:poll) }
  let!(:option) { create(:option, :poll => poll) }
  let(:json) { JSON.parse(response.body) }

  context 'when request poll show without Content-Type' do

    it 'return 406 NOT ACCEPTABLE' do
      get :show, :params => {:id => poll.id}, :format => :json
      expect(response).to have_http_status(:not_acceptable)
    end

  end

  context 'when request poll show with right Content-Type' do

    before(:each) do
      request.headers['Content-Type'] = 'application/json'
      get :show, :params => {:id => poll.id}, :format => :json
    end

    it 'return 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns poll description' do
      expect(json["poll_description"]).to be_eql(poll.description)
    end

    it 'returns poll options' do
      response_option = json["options"].first
      expect(response_option["option_description"]).to be_eql(poll.options.first.description)
    end

  end

end
