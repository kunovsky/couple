#TODO: Split this into smaller files

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

###Questionnaire 1 GENERAL HAPPINESS###

general_happiness = Questionnaire.create!(title: "General Relationship Happiness", cutoff_score: 56, ok_score: 60, weight: 0.3333) #cutoff_score < 56 and it's a bad thing.

general_happiness.questions.create! content: "I feel emotionally close to my partner"
general_happiness.questions.create! content: "I think that my partner really cares about me"
general_happiness.questions.create! content: "I feel confident that we can deal with whatever problems might arise"
general_happiness.questions.create! content: "I would consider myself happy in this relationship"
general_happiness.questions.create! content: "My partner really listens to me"
general_happiness.questions.create! content: "I feel that my partner finds me physically attractive"
general_happiness.questions.create! content: "I can talk to my partner about anything"
general_happiness.questions.create! content: "I feel that my partner is very interested in me"
general_happiness.questions.create! content: "I feel respected by my partner"
general_happiness.questions.create! content: "I am committed to staying together"
general_happiness.questions.create! content: "I have a great deal of respect and admiration for my partner"
general_happiness.questions.create! content: "My partner really tries hard to meet my needs"
general_happiness.questions.create! content: "My partner respects my dreams in life"
general_happiness.questions.create! content: "My partner is one of my best friends"
general_happiness.questions.create! content: "My partner rarely puts me down"

general_happiness.questions.each do |question|
  agree_disagree.each do |response|
    question.possible_responses << response
  end
end

general_happiness_products = []

general_happiness_products << Product.create!(name: "Gottman General Happiness Product", description: "This product is designed to help your General Happiness")
general_happiness_products << Product.create!(name: "Gottman General Happiness Therapy Help", description: "Personalized therapy to help you with this problem")

general_happiness.results.create!(quadrant_type: "Individual Good", content: "This Individual Scored Good - no problems")

ok = general_happiness.results.create!(quadrant_type: "Individual Ok", content: "This Individual Scored Ok - has some problems")
ok.products << general_happiness_products[0]

bad = general_happiness.results.create!(quadrant_type: "Individual Bad", content: "This Individual Scored Bad -has problems")
general_happiness_products.each {|product| bad.products << product}

general_happiness.results.create!(quadrant_type: "Couple Good Good", content: "Both Partners Scored Good - no problems")

bad = general_happiness.results.create!(quadrant_type: "Couple Good Bad", content: "Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
general_happiness_products.each {|product| bad.products << product}

ok = general_happiness.results.create!(quadrant_type: "Couple Good Ok", content: "Partner 1 Scored Good Partner 2 Scored Ok - partner 2 has some issues that they need partner 1s help with")
ok.products << general_happiness_products[0]

bad = general_happiness.results.create!(quadrant_type: "Couple Bad Good", content: "Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")
general_happiness_products.each {|product| bad.products << product}

bad = general_happiness.results.create!(quadrant_type: "Couple Bad Bad", content: "Both Partners Scored Bad -both have problems")
general_happiness_products.each {|product| bad.products << product}

bad = general_happiness.results.create!(quadrant_type: "Couple Bad Ok", content: "Partner 1 Scored Bad Partner 2 Scored Ok - partner 1 has serious issues and partner 2 has less serious issues")
general_happiness_products.each {|product| bad.products << product}

ok = general_happiness.results.create!(quadrant_type: "Couple Ok Good", content: "Partner 1 Scored Ok Partner 2 Scored Good - partner 1 has some issues that they need partner 2s help with")
ok.products << general_happiness_products[0]

bad = general_happiness.results.create!(quadrant_type: "Couple Ok Bad", content: "Partner 1 Scored Ok Partner 2 Scored Bad - partner 2 has serious issues and partner 1 has less serious issues")
general_happiness_products.each {|product| bad.products << product}

ok = general_happiness.results.create!(quadrant_type: "Couple Ok Ok", content: "Both Partners Scored Just Ok - there are some minor issues that need to be addressed")
ok.products << general_happiness_products[0]

### Questionnaire 2 LOVEMAPS###

love_maps = Questionnaire.create!(title: "Love Maps", cutoff_score: 12, ok_score: 14, weight: 0.3333) #cutoff_score < 12 and it's a bad thing

love_maps.questions.create! content: "I know my partner's favorite side of the bed"
love_maps.questions.create! content: "I can tell you what my partner was wearing when we first met"
love_maps.questions.create! content: "I can name my partner's favorite cologne or perfume"
love_maps.questions.create! content: "I can tell you my partner's favorite holiday"
love_maps.questions.create! content: "I know my partner's favorite TV show"
love_maps.questions.create! content: "I know what my partner's ideal job would be"
love_maps.questions.create! content: "I know the two people which my partner admires most in the world (myself excluded)"
love_maps.questions.create! content: "I can name my partner's greatest source of support (other than myself)"
love_maps.questions.create! content: "I can describe in detail my partner's day either today or yesterday"
love_maps.questions.create! content: "I know what makes my partner feel most competent"
love_maps.questions.create! content: "I can list the relatives my partner likes the least"
love_maps.questions.create! content: "I know my partner's major current worries"
love_maps.questions.create! content: "I know what personal improvements my partner wants to make in their life?"
love_maps.questions.create! content: "My partner is familiar with what are my current stresses"
love_maps.questions.create! content: "I can tell you some of my partner's life dreams"


love_maps.questions.each do |question|
  true_false_normal.each do |response|
    question.possible_responses << response
  end
end

love_maps_products = []

love_maps_products << Product.create!(name: "Gottman Love Maps Product", description: "This product is designed to help your Love Maps")
love_maps_products << Product.create!(name: "Gottman Love Maps Therapy Help", description: "Personalized therapy to help you with this problem")

love_maps.results.create!(quadrant_type: "Individual Good", content: "This Individual Scored Good - no problems")

ok = love_maps.results.create!(quadrant_type: "Individual Ok", content: "This Individual Scored Ok - has some problems")
ok.products << love_maps_products[0]

bad = love_maps.results.create!(quadrant_type: "Individual Bad", content: "This Individual Scored Bad -has problems")
love_maps_products.each {|product| bad.products << product}

love_maps.results.create!(quadrant_type: "Couple Good Good", content: "Both Partners Scored Good - no problems")

bad = love_maps.results.create!(quadrant_type: "Couple Good Bad", content: "Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
love_maps_products.each {|product| bad.products << product}

ok = love_maps.results.create!(quadrant_type: "Couple Good Ok", content: "Partner 1 Scored Good Partner 2 Scored Ok - partner 2 has some issues that they need partner 1s help with")
ok.products << love_maps_products[0]

bad = love_maps.results.create!(quadrant_type: "Couple Bad Good", content: "Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")
love_maps_products.each {|product| bad.products << product}

bad = love_maps.results.create!(quadrant_type: "Couple Bad Bad", content: "Both Partners Scored Bad -both have problems")
love_maps_products.each {|product| bad.products << product}

bad = love_maps.results.create!(quadrant_type: "Couple Bad Ok", content: "Partner 1 Scored Bad Partner 2 Scored Ok - partner 1 has serious issues and partner 2 has less serious issues")
love_maps_products.each {|product| bad.products << product}

ok = love_maps.results.create!(quadrant_type: "Couple Ok Good", content: "Partner 1 Scored Ok Partner 2 Scored Good - partner 1 has some issues that they need partner 2s help with")
ok.products << love_maps_products[0]

bad = love_maps.results.create!(quadrant_type: "Couple Ok Bad", content: "Partner 1 Scored Ok Partner 2 Scored Bad - partner 2 has serious issues and partner 1 has less serious issues")
love_maps_products.each {|product| bad.products << product}

ok = love_maps.results.create!(quadrant_type: "Couple Ok Ok", content: "Both Partners Scored Just Ok - there are some minor issues that need to be addressed")
ok.products << love_maps_products[0]


###Questionnaire 3 FONDNESS AND ADMIRATION###

fondness_and_admiration = Questionnaire.create!(title: "Fondness and Admiration", cutoff_score: 4, ok_score: 5, weight: 0.1111) #cutoff_score < 4 and it's a bad thing

fondness_and_admiration.questions.create! content: "My partner really respects me"
fondness_and_admiration.questions.create! content: "I feel loved and cared for in this relationship"
fondness_and_admiration.questions.create! content: "Romance is something our relationship definitely still has in it"
fondness_and_admiration.questions.create! content: "When I come into a room my partner is glad to see me"
fondness_and_admiration.questions.create! content: "My partner appreciates the things I do in this relationship"


fondness_and_admiration.questions.each do |question|
  true_false_normal.each do |response|
    question.possible_responses << response
  end
end

fondness_and_admiration_products = []

fondness_and_admiration_products << Product.create!(name: "Gottman Fondness & Admiration Product", description: "This product is designed to help your Fondness & Admiration")
fondness_and_admiration_products << Product.create!(name: "Gottman Fondness & Admiration Therapy Help", description: "Personalized therapy to help you with this problem")

fondness_and_admiration.results.create!(quadrant_type: "Individual Good", content: "This Individual Scored Good - no problems")

ok = fondness_and_admiration.results.create!(quadrant_type: "Individual Ok", content: "This Individual Scored Ok - has some problems")
ok.products << fondness_and_admiration_products[0]

bad = fondness_and_admiration.results.create!(quadrant_type: "Individual Bad", content: "This Individual Scored Bad -has problems")
fondness_and_admiration_products.each {|product| bad.products << product}

fondness_and_admiration.results.create!(quadrant_type: "Couple Good Good", content: "Both Partners Scored Good - no problems")

bad = fondness_and_admiration.results.create!(quadrant_type: "Couple Good Bad", content: "Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
fondness_and_admiration_products.each {|product| bad.products << product}

ok = fondness_and_admiration.results.create!(quadrant_type: "Couple Good Ok", content: "Partner 1 Scored Good Partner 2 Scored Ok - partner 2 has some issues that they need partner 1s help with")
ok.products << fondness_and_admiration_products[0]

bad = fondness_and_admiration.results.create!(quadrant_type: "Couple Bad Good", content: "Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")
fondness_and_admiration_products.each {|product| bad.products << product}

bad = fondness_and_admiration.results.create!(quadrant_type: "Couple Bad Bad", content: "Both Partners Scored Bad -both have problems")
fondness_and_admiration_products.each {|product| bad.products << product}

bad = fondness_and_admiration.results.create!(quadrant_type: "Couple Bad Ok", content: "Partner 1 Scored Bad Partner 2 Scored Ok - partner 1 has serious issues and partner 2 has less serious issues")
fondness_and_admiration_products.each {|product| bad.products << product}

ok = fondness_and_admiration.results.create!(quadrant_type: "Couple Ok Good", content: "Partner 1 Scored Ok Partner 2 Scored Good - partner 1 has some issues that they need partner 2s help with")
ok.products << fondness_and_admiration_products[0]

bad = fondness_and_admiration.results.create!(quadrant_type: "Couple Ok Bad", content: "Partner 1 Scored Ok Partner 2 Scored Bad - partner 2 has serious issues and partner 1 has less serious issues")
fondness_and_admiration_products.each {|product| bad.products << product}

ok = fondness_and_admiration.results.create!(quadrant_type: "Couple Ok Ok", content: "Both Partners Scored Just Ok - there are some minor issues that need to be addressed")
ok.products << fondness_and_admiration_products[0]



###Questionnaire 4 TURNING TOWARDS###

turning_towards = Questionnaire.create!(title: "Turning Towards", cutoff_score: 4, ok_score: 5, weight: 0.1111) #cutoff_score < 4 and it's a bad thing

turning_towards.questions.create! content: "I really enjoy discussing things with my partner"
turning_towards.questions.create! content: "We always have a lot to say to each other"
turning_towards.questions.create! content: "We have a lot of fun together in our everyday lives"
turning_towards.questions.create! content: "My partner responds with interest when I have interesting things to say"
turning_towards.questions.create! content: "We like to do a lot of the same things"


turning_towards.questions.each do |question|
  true_false_normal.each do |response|
    question.possible_responses << response
  end
end

turning_towards_products = []

turning_towards_products << Product.create!(name: "Gottman Turning Towards Product", description: "This product is designed to help your Turning Towards")
turning_towards_products << Product.create!(name: "Gottman Turning Towards Therapy Help", description: "Personalized therapy to help you with this problem")

turning_towards.results.create!(quadrant_type: "Individual Good", content: "This Individual Scored Good - no problems")

ok = turning_towards.results.create!(quadrant_type: "Individual Ok", content: "This Individual Scored Ok - has some problems")
ok.products << turning_towards_products[0]

bad = turning_towards.results.create!(quadrant_type: "Individual Bad", content: "This Individual Scored Bad -has problems")
turning_towards_products.each {|product| bad.products << product}

turning_towards.results.create!(quadrant_type: "Couple Good Good", content: "Both Partners Scored Good - no problems")

bad = turning_towards.results.create!(quadrant_type: "Couple Good Bad", content: "Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
turning_towards_products.each {|product| bad.products << product}

ok = turning_towards.results.create!(quadrant_type: "Couple Good Ok", content: "Partner 1 Scored Good Partner 2 Scored Ok - partner 2 has some issues that they need partner 1s help with")
ok.products << turning_towards_products[0]

bad = turning_towards.results.create!(quadrant_type: "Couple Bad Good", content: "Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")
turning_towards_products.each {|product| bad.products << product}

bad = turning_towards.results.create!(quadrant_type: "Couple Bad Bad", content: "Both Partners Scored Bad -both have problems")
turning_towards_products.each {|product| bad.products << product}

bad = turning_towards.results.create!(quadrant_type: "Couple Bad Ok", content: "Partner 1 Scored Bad Partner 2 Scored Ok - partner 1 has serious issues and partner 2 has less serious issues")
turning_towards_products.each {|product| bad.products << product}

ok = turning_towards.results.create!(quadrant_type: "Couple Ok Good", content: "Partner 1 Scored Ok Partner 2 Scored Good - partner 1 has some issues that they need partner 2s help with")
ok.products << turning_towards_products[0]

bad = turning_towards.results.create!(quadrant_type: "Couple Ok Bad", content: "Partner 1 Scored Ok Partner 2 Scored Bad - partner 2 has serious issues and partner 1 has less serious issues")
turning_towards_products.each {|product| bad.products << product}

ok = turning_towards.results.create!(quadrant_type: "Couple Ok Ok", content: "Both Partners Scored Just Ok - there are some minor issues that need to be addressed")
ok.products << turning_towards_products[0]


###Questionnaire 5 EMOTIONAL DISENGAGEMENT AND LONELINESS###

emotional_loneliness = Questionnaire.create!(title: "Emotional Disengagement and Loneliness", cutoff_score: 4, ok_score: 5, weight: 0.1111) #cutoff_score < 4 and it's a bad thing

emotional_loneliness.questions.create! content: "I often find myself disappointed in this relationship"
emotional_loneliness.questions.create! content: "I will at times find myself quite lonely in this relationship"
emotional_loneliness.questions.create! content: "It is hard for my deepest feelings to get much attention in this relationship"
emotional_loneliness.questions.create! content: "There is not enough closeness between us"
emotional_loneliness.questions.create! content: "I have adapted to a lot in this relationship and I am not so sure it’s a good idea"


emotional_loneliness.questions.each do |question|
  true_false_reversed.each do |response|
    question.possible_responses << response
  end
end

emotional_loneliness_products = []

emotional_loneliness_products << Product.create!(name: "Gottman Emotional Lonliness Product", description: "This product is designed to help your Emotional Lonliness")
emotional_loneliness_products << Product.create!(name: "Gottman Emotional Lonliness Therapy Help", description: "Personalized therapy to help you with this problem")

emotional_loneliness.results.create!(quadrant_type: "Individual Good", content: "This Individual Scored Good - no problems")

ok = emotional_loneliness.results.create!(quadrant_type: "Individual Ok", content: "This Individual Scored Ok - has some problems")
ok.products << emotional_loneliness_products[0]

bad = emotional_loneliness.results.create!(quadrant_type: "Individual Bad", content: "This Individual Scored Bad -has problems")
emotional_loneliness_products.each {|product| bad.products << product}

emotional_loneliness.results.create!(quadrant_type: "Couple Good Good", content: "Both Partners Scored Good - no problems")

bad = emotional_loneliness.results.create!(quadrant_type: "Couple Good Bad", content: "Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
emotional_loneliness_products.each {|product| bad.products << product}

ok = emotional_loneliness.results.create!(quadrant_type: "Couple Good Ok", content: "Partner 1 Scored Good Partner 2 Scored Ok - partner 2 has some issues that they need partner 1s help with")
ok.products << emotional_loneliness_products[0]

bad = emotional_loneliness.results.create!(quadrant_type: "Couple Bad Good", content: "Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")
emotional_loneliness_products.each {|product| bad.products << product}

bad = emotional_loneliness.results.create!(quadrant_type: "Couple Bad Bad", content: "Both Partners Scored Bad -both have problems")
emotional_loneliness_products.each {|product| bad.products << product}

bad = emotional_loneliness.results.create!(quadrant_type: "Couple Bad Ok", content: "Partner 1 Scored Bad Partner 2 Scored Ok - partner 1 has serious issues and partner 2 has less serious issues")
emotional_loneliness_products.each {|product| bad.products << product}

ok = emotional_loneliness.results.create!(quadrant_type: "Couple Ok Good", content: "Partner 1 Scored Ok Partner 2 Scored Good - partner 1 has some issues that they need partner 2s help with")
ok.products << emotional_loneliness_products[0]

bad = emotional_loneliness.results.create!(quadrant_type: "Couple Ok Bad", content: "Partner 1 Scored Ok Partner 2 Scored Bad - partner 2 has serious issues and partner 1 has less serious issues")
emotional_loneliness_products.each {|product| bad.products << product}

ok = emotional_loneliness.results.create!(quadrant_type: "Couple Ok Ok", content: "Both Partners Scored Just Ok - there are some minor issues that need to be addressed")
ok.products << emotional_loneliness_products[0]


###Questionnaire 6 OVERALL SCORE### Note this is not an actual questionnaire, it is just a means of determining overall results

overall_state = Questionnaire.create!(title: "Overall Relationship Score", cutoff_score: 90, ok_score: 80)

overall_state_products = []

overall_state_products << Product.create!(name: "Gottman Overall Relationship Product", description: "This product is designed to help your Overall Relationship")
overall_state_products << Product.create!(name: "Gottman Overall Relationship Therapy Help", description: "Personalized therapy to help you with this problem")

overall_state.results.create!(quadrant_type: "Individual Good", content: "This Individual Scored Good - no problems")

ok = overall_state.results.create!(quadrant_type: "Individual Ok", content: "This Individual Scored Ok - has some problems")
ok.products << overall_state_products[0]

bad = overall_state.results.create!(quadrant_type: "Individual Bad", content: "This Individual Scored Bad -has problems")
overall_state_products.each {|product| bad.products << product}

overall_state.results.create!(quadrant_type: "Couple Good Good", content: "Both Partners Scored Good - no problems")

bad = overall_state.results.create!(quadrant_type: "Couple Good Bad", content: "Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
overall_state_products.each {|product| bad.products << product}

ok = overall_state.results.create!(quadrant_type: "Couple Good Ok", content: "Partner 1 Scored Good Partner 2 Scored Ok - partner 2 has some issues that they need partner 1s help with")
ok.products << overall_state_products[0]

bad = overall_state.results.create!(quadrant_type: "Couple Bad Good", content: "Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")
overall_state_products.each {|product| bad.products << product}

bad = overall_state.results.create!(quadrant_type: "Couple Bad Bad", content: "Both Partners Scored Bad -both have problems")
overall_state_products.each {|product| bad.products << product}

bad = overall_state.results.create!(quadrant_type: "Couple Bad Ok", content: "Partner 1 Scored Bad Partner 2 Scored Ok - partner 1 has serious issues and partner 2 has less serious issues")
overall_state_products.each {|product| bad.products << product}

ok = overall_state.results.create!(quadrant_type: "Couple Ok Good", content: "Partner 1 Scored Ok Partner 2 Scored Good - partner 1 has some issues that they need partner 2s help with")
ok.products << overall_state_products[0]

bad = overall_state.results.create!(quadrant_type: "Couple Ok Bad", content: "Partner 1 Scored Ok Partner 2 Scored Bad - partner 2 has serious issues and partner 1 has less serious issues")
overall_state_products.each {|product| bad.products << product}

ok = overall_state.results.create!(quadrant_type: "Couple Ok Ok", content: "Both Partners Scored Just Ok - there are some minor issues that need to be addressed")
ok.products << overall_state_products[0]