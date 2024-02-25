class StaticController < ApplicationController
  before_action :set_friends

  def dashboard
  end

  def person
    user = User.find(params[:id])
    @expenses = user.payer_expenses  # TODO: This will be paginated as well
  end

  private

  def set_friends
    @friends = User.where.not(id: current_user.id) # TODO: This will be paginated
  end
end
