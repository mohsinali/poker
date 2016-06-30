class Api::V1::HandsController < ApplicationController
  protect_from_forgery

  def create
    @results = []
    hands = []
    roles = []
    cards = params[:cards]
    
    cards.each do |hand|
      hand = Hand.new(hand)
      hands << hand
      roles << hand.get_role
    end

    best = roles.min
    hash = Hash[roles.map.with_index.to_a]
    best = hash[best]

    hands.each_with_index do |hand, index|
      
      result = Hash.new

      if index == best
        result = {
          card: hand.hand,
          role: Yetting.card_roles[roles[index]],
          best: true
        }
      else
        result = {
          card: hand.hand,
          role: Yetting.card_roles[roles[index]]
        }
      end
      @results << result
    end

    render json: {result: @results}
  end
end
