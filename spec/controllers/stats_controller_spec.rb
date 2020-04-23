require 'rails_helper'

RSpec.describe StatsController, type: :controller do
  render_views

  context 'show stats' do

    let!(:poll) { create(:poll) }

    let!(:first_option) { create(:option, :poll => poll) }
    let!(:second_option) { create(:option, :poll => poll) }

    let!(:first_vote) { create(:vote, :option => first_option) }
    let!(:second_vote) { create(:vote, :option => first_option) }
    let!(:third_vote) { create(:vote, :option => second_option) }

    let!(:first_view) { create(:view, :poll => poll) }
    let!(:second_view) { create(:view, :poll => poll) }
    let!(:third_view) { create(:view, :poll => poll) }
    let!(:fourth_view) { create(:view, :poll => poll) }

    let(:json) { JSON.parse(response.body) }

    describe 'without Content-Type' do

      it 'return 406 NOT ACCEPTABLE' do
        get :show, :params => {:id => poll.id}, :format => :json
        expect(response).to have_http_status(:not_acceptable)
      end

    end

    describe 'with wrong poll id' do

      it 'returns 404 NOT FOUND' do
        request.headers['Content-Type'] = 'application/json'
        get :show, :params => {:id => 0}, :format => :json
        expect(response).to have_http_status(:not_found)
      end

    end

    describe 'with right params' do

      before :each do
        request.headers['Content-Type'] = 'application/json'
        get :show, :params => {:id => poll.id}, :format => :json
      end

      it 'return 200 OK' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns poll views' do
        expect(json["views"]).to eq(4)
      end

      it 'returns poll votes node' do
        expect(json).to include("votes")
      end

      it 'returns options quantity of votes' do
        response_option = json["votes"].first
        expect(response_option["qty"]).to eq(2)
      end

    end

  end

end
