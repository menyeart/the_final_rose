class OutingsController < ApplicationController
  def show
    @outing = Outing.find(params[:id])
    @outing_contestant_count = @outing.contestants
  end
end