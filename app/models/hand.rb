class Hand 
  attr_accessor :hand

  def initialize(hand)
    @hand = hand
  end

  def parse_cards(cards)
    cards.split(' ')
  end

  def get_suit(card)
    card[0]
  end

  def get_rank(card)
    card[1..-1]
  end

  def get_role
    cards = parse_cards(self.hand)
    role_indentification(cards)
  end

  def role_indentification(cards)
    suits = []
    ranks = []
    role = 9
    cards.each do |card|
     suits << get_suit(card)
     ranks << get_rank(card).to_i
    end 
    ranks = ranks.sort

    if flash?(suits)
      if straight?(ranks)
        role = 1
      else
        role = 4
      end
    else
      if straight?(ranks)
        role = 5
      else
        if four_of_a_kind?(ranks)
          role = 2
        elsif full_house?(ranks)
          role = 3
        elsif uniq_three?(ranks)
          if three_of_a_kind?(ranks)
            role = 6
          else
            role = 7
          end
        elsif one_pair?(ranks)
          role = 8
        end

      end
    end
    role
  end

  def flash?(suits)
    suits.uniq.length == 1
  end 

  def straight?(ranks)
    all_in_sequence?(ranks)
  end

  def all_in_sequence?(sorted_array)
    flag = false
    sorted_array.each_cons(2) do |x,y|
      if y-x ==1
        flag = true
      elsif y-x == 9
        flag = true
      else
        flag = false
        break
      end
    end
    flag
  end

  def four_of_a_kind?(sorted_array)
    flag = false
    sorted_array.each_cons(4) do |x|
      if x.uniq.length == 1
        flag = true
      end
    end
    flag
  end

  def full_house?(sorted_array)
    sorted_array.uniq.length == 2
  end

  def uniq_three?(sorted_array)
    sorted_array.uniq.length ==3
  end

  def three_of_a_kind?(sorted_array)
    flag = false
    sorted_array.each_cons(3) do |x|
      if x.uniq.length == 1
        flag = true
      end
    end
    flag
  end

  def one_pair?(sorted_array)
    sorted_array.uniq.length == 4
  end

end
