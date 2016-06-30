class HandsController < ApplicationController
  def index
  end

  def new
  end

  def identify
    @hand = Hand.new(params[:card][:data])
    role = @hand.get_role
    @result = Yetting.card_roles[role]
  end

end
