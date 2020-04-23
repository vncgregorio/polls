class StatsController < ApplicationController

  before_action :set_poll

  def show
  end

  private

    def set_poll
      begin
        @poll = Poll.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        render :body => nil, :status => 404
      end
    end

end
