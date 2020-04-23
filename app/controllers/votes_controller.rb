class VotesController < ApplicationController

  before_action :set_poll

  def create
    @vote_service = VoteService.new(
      :poll => @poll,
      :number => vote_params[:option_id]
    )

    if @vote_service.save
      render :body => nil, :status => :created
    else
      render json: ErrorSerializer.serialize(@vote_service.errors), status: :unprocessable_entity
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

    def vote_params
      params.permit(
        :option_id
      )
    end

end
