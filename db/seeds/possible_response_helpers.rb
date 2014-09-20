module Seeds
  module PossibleResponseHelpers
    agree_disagree = []
    (1..5).to_a.each {|num| agree_disagree << PossibleResponse.find(num)}
    true_false_normal = []
    (6..7).to_a.each {|num| true_false_normal << PossibleResponse.find(num)}
    true_false_reversed = []
    (8..9).to_a.each {|num| true_false_reversed << PossibleResponse.find(num)}
  end
end