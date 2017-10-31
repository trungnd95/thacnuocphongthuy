class FeedbacksController < ApplicationController
  before_action :check_if_admin!, only: [:index, :update]

  def create
    @feedback =  Feedback.new feedback_params
    if @feedback.save
      render json: @feedback, status: :ok
    else
      render json: @feedback.errors, status: :unprocessable_entity
    end
  end

  private
  def feedback_params
    params.require(:feedback).permit(:id, :email, :content, :reply)
  end
end
