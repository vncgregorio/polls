require 'rails_helper'

RSpec.describe VotesController, type: :controller do
  render_views

  context 'poll vote' do

    let!(:poll) { create(:poll) }
    let!(:option) { create(:option, :poll => poll) }
    let(:json) { JSON.parse(response.body) }

    describe 'without Content-Type' do

      it 'return 406 NOT ACCEPTABLE' do
        raw = {
          "option_id" => option.number
        }.to_json
        post :create, :params => {:id => poll.id}, body: raw, :format => :json
        expect(response).to have_http_status(:not_acceptable)
      end

    end

    describe 'without option id' do

      before :each do
        request.headers['Content-Type'] = 'application/json'
      end

      it 'return 406 NOT ACCEPTABLE' do
        raw = {}.to_json
        post :create, :params => {:id => poll.id}, body: raw, :format => :json
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end

    describe 'with wrong poll id' do

      before :each do
        request.headers['Content-Type'] = 'application/json'
      end

      it 'returns 404 NOT FOUND' do
        raw = {
          "option_id" => option.number
        }.to_json
        post :create, :params => {:id => 0}, body: raw, :format => :json
        expect(response).to have_http_status(:not_found)
      end

    end

    describe 'with right params' do

      before :each do
        request.headers['Content-Type'] = 'application/json'
      end

      it 'returns 404 NOT FOUND' do
        raw = {
          "option_id" => option.number
        }.to_json
        post :create, :params => {:id => poll.id}, body: raw, :format => :json
        expect(response).to have_http_status(:created)
      end

    end

  end

end
