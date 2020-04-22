class PollsController < ApplicationController

  before_action :set_poll, only: [:show]

  def show
  end

  def create
  end

  private

    def set_poll
      @poll = Poll.find(params[:id])
    end

    def poll_params
      params.require(:poll).permit(
        :poll_description,
        :options
      )
    end

end
