#TODO: only include therapy for bad_x results. For all other problem variations just include the gottman product?
###Possible Responses ###
agree_disagree = []

agree_disagree << (PossibleResponse.create! content: "Strongly Disagree", point_value: 1)
agree_disagree << (PossibleResponse.create! content: "Disagree", point_value: 2)
agree_disagree << (PossibleResponse.create! content: "Neutral", point_value: 3)
agree_disagree << (PossibleResponse.create! content: "Agree", point_value: 4)
agree_disagree << (PossibleResponse.create! content: "Strongly Agree", point_value: 5)

true_false_normal = []

true_false_normal << (PossibleResponse.create! content: "True", point_value: 1)
true_false_normal << (PossibleResponse.create! content: "False", point_value: 0)

true_false_reversed = []

true_false_reversed << (PossibleResponse.create! content: "True", point_value: 0)
true_false_reversed << (PossibleResponse.create! content: "False", point_value: 1)


require File.expand_path('../groupings/first/general_happiness', __FILE__)
require File.expand_path('../groupings/second/love_maps', __FILE__)
require File.expand_path('../groupings/third/fondness_and_admiration', __FILE__)
require File.expand_path('../groupings/third/emotional_disengagement', __FILE__)
require File.expand_path('../groupings/third/turning_towards', __FILE__)
require File.expand_path('../groupings/overall/overall', __FILE__)