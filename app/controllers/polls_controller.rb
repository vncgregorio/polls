class PollsController < ApplicationController

  before_action :set_poll, only: [:show, :vote]

  def show
  end

  def create
    @poll = Poll.new(poll_params)

    if @poll.save
      render json: {:poll_id => @poll.id}
    else
      render json: ErrorSerializer.serialize(@poll.errors), status: :unprocessable_entity
    end
  end

  private

    def set_poll
      begin
        @poll = Poll.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        render :body => nil, :status => 404
      end
    end

    def poll_params
      params.permit(
        :poll_description,
        :options
      )
    end

end
