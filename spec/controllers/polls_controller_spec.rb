require 'rails_helper'

RSpec.describe PollsController, type: :controller do
  render_views

  context 'show poll' do

    let!(:poll) { create(:poll) }
    let!(:option) { create(:option, :poll => poll) }
    let(:json) { JSON.parse(response.body) }

    context 'without Content-Type' do

      it 'return 406 NOT ACCEPTABLE' do
        get :show, :params => {:id => poll.id}, :format => :json
        expect(response).to have_http_status(:not_acceptable)
      end

    end

    context 'with right Content-Type and wrong poll id' do

      it 'returns 404 NOT FOUND' do
        request.headers['Content-Type'] = 'application/json'
        get :show, :params => {:id => 0}, :format => :json
        expect(response).to have_http_status(:not_found)
      end

    end

    context 'with right Content-Type' do

      before :each do
        request.headers['Content-Type'] = 'application/json'
        get :show, :params => {:id => poll.id}, :format => :json
      end

      it 'return 200 OK' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns poll description' do
        expect(json["poll_description"]).to eq(poll.description)
      end

      it 'returns poll options' do
        response_option = json["options"].first
        expect(response_option["option_description"]).to eq(poll.options.first.description)
      end

    end

  end

  context 'create poll' do

    let(:json) { JSON.parse(response.body) }

    context 'without description' do

      before :each do
        request.headers['Content-Type'] = 'application/json'
        raw = {
                :options => [
                  "First choice",
                  "Second choice"
                  ]
                }.to_json
        post :create, body: raw, :format => :json
      end

      it 'return 422 UNPROCESSABLE ENTITY' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'return error details' do
        errors = json["errors"].first
        expect(errors["title"]).to eq("can't be blank")
      end

    end

    context 'with right params' do

      before :each do
        request.headers['Content-Type'] = 'application/json'
        raw = {
                :poll_description => "Test poll",
                :options => [
                  "First choice",
                  "Second choice"
                  ]
                }.to_json
        post :create, body: raw, :format => :json
      end

      it 'return 200 OK' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns poll id' do
        expect(json).to include("poll_id")
      end

    end

  end

  context 'poll vote' do

    before :each do

    end

    context 'without description' do
    end

    context 'with wrong poll id' do
    end

    context 'with right params' do
    end

  end

end
