User.create!(first_name: "Tyson")
ActualResponse.create! user_id: 1

unhappy = User.create!(first_name: "Tester")
ActualResponse.create! user_id: 2
bad_survey = {"5"=>{"41"=>"8", "42"=>"8", "43"=>"8", "44"=>"8", "45"=>"8"}, "1"=>{"1"=>"1", "2"=>"1", "3"=>"1", "4"=>"1", "5"=>"1", "6"=>"1", "7"=>"1", "8"=>"1", "9"=>"1", "10"=>"1", "11"=>"1", "12"=>"1", "13"=>"1", "14"=>"1", "15"=>"1"}, "2"=>{"16"=>"7", "17"=>"7", "18"=>"7", "19"=>"7", "20"=>"7", "21"=>"7", "22"=>"7", "23"=>"7", "24"=>"7", "25"=>"7", "26"=>"7", "27"=>"7", "28"=>"7", "29"=>"7", "30"=>"7"}, "3"=>{"31"=>"7", "32"=>"7", "33"=>"7", "34"=>"7", "35"=>"7"}, "4"=>{"36"=>"7", "37"=>"7", "38"=>"7", "39"=>"7", "40"=>"7"}}
unhappy.actual_response.update_attribute(:responses, bad_survey)

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

###Questionnaire 1 OVERALL HAPPINESS###

overall_happiness = Questionnaire.create! title: "Overall Happiness", cutoff_score: 56 #score < 56 and it's a bad thing

overall_happiness.questions.create! content: "I feel emotionally close to my partner"
overall_happiness.questions.create! content: "I think that my partner really cares about me"
overall_happiness.questions.create! content: "I feel confident that we can deal with whatever problems might arise"
overall_happiness.questions.create! content: "I would consider myself happy in this relationship"
overall_happiness.questions.create! content: "My partner really listens to me"
overall_happiness.questions.create! content: "I feel that my partner finds me physically attractive"
overall_happiness.questions.create! content: "I can talk to my partner about anything"
overall_happiness.questions.create! content: "I feel that my partner is very interested in me"
overall_happiness.questions.create! content: "I feel respected by my partner"
overall_happiness.questions.create! content: "I am committed to staying together"
overall_happiness.questions.create! content: "I have a great deal of respect and admiration for my partner"
overall_happiness.questions.create! content: "My partner really tries hard to meet my needs"
overall_happiness.questions.create! content: "My partner respects my dreams in life"
overall_happiness.questions.create! content: "My partner is one of my best friends"
overall_happiness.questions.create! content: "My partner rarely puts me down"

overall_happiness.questions.each do |question|
  agree_disagree.each do |response|
    question.possible_responses << response
  end
end

overall_happiness.results.create!(quadrant_type: "Individual Good", content: "This Individual Scored Good - no problems")
overall_happiness.results.create!(quadrant_type: "Individual Ok", content: "This Individual Scored Ok - has some problems")
overall_happiness.results.create!(quadrant_type: "Individual Bad", content: "This Individual Scored Bad -has problems")
overall_happiness.results.create!(quadrant_type: "Couple Good", content: "Both Partners Scored Good - no problems")
overall_happiness.results.create!(quadrant_type: "Couple Bad", content: "Both Partners Scored Bad -both have problems")
overall_happiness.results.create!(quadrant_type: "Couple Good Bad", content: "Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
overall_happiness.results.create!(quadrant_type: "Couple Bad Good", content: "Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")

### Questionnaire 2 LOVEMAPS###

love_maps = Questionnaire.create! title: "Love Maps", cutoff_score: 10 #score < 10 and it's a bad thing

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

love_maps.results.create!(quadrant_type: "Individual Good", content: "This Individual Scored Good - no problems")
love_maps.results.create!(quadrant_type: "Individual Ok", content: "This Individual Scored Ok - has some problems")
love_maps.results.create!(quadrant_type: "Individual Bad", content: "This Individual Scored Bad -has problems")
love_maps.results.create!(quadrant_type: "Couple Good", content: "Both Partners Scored Good - no problems")
love_maps.results.create!(quadrant_type: "Couple Bad", content: "Both Partners Scored Bad -both have problems")
love_maps.results.create!(quadrant_type: "Couple Good Bad", content: "Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
love_maps.results.create!(quadrant_type: "Couple Bad Good", content: "Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")

###Questionnaire 3 FONDNESS AND ADMIRATION###

fondness_and_admiration = Questionnaire.create! title: "Fondness and Admiration", cutoff_score: 4 #score < 4 and it's a bad thing

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

fondness_and_admiration.results.create!(quadrant_type: "Individual Good", content: "This Individual Scored Good - no problems")
fondness_and_admiration.results.create!(quadrant_type: "Individual Ok", content: "This Individual Scored Ok - has some problems")
fondness_and_admiration.results.create!(quadrant_type: "Individual Bad", content: "This Individual Scored Bad -has problems")
fondness_and_admiration.results.create!(quadrant_type: "Couple Good", content: "Both Partners Scored Good - no problems")
fondness_and_admiration.results.create!(quadrant_type: "Couple Bad", content: "Both Partners Scored Bad -both have problems")
fondness_and_admiration.results.create!(quadrant_type: "Couple Good Bad", content: "Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
fondness_and_admiration.results.create!(quadrant_type: "Couple Bad Good", content: "Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")


###Questionnaire 4 TURNING TOWARDS###

turning_towards = Questionnaire.create! title: "Turning Towards", cutoff_score: 4 #score < 4 and it's a bad thing

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

turning_towards.results.create!(quadrant_type: "Individual Good", content: "This Individual Scored Good - no problems")
turning_towards.results.create!(quadrant_type: "Individual Ok", content: "This Individual Scored Ok - has some problems")
turning_towards.results.create!(quadrant_type: "Individual Bad", content: "This Individual Scored Bad -has problems")
turning_towards.results.create!(quadrant_type: "Couple Good", content: "Both Partners Scored Good - no problems")
turning_towards.results.create!(quadrant_type: "Couple Bad", content: "Both Partners Scored Bad -both have problems")
turning_towards.results.create!(quadrant_type: "Couple Good Bad", content: "Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
turning_towards.results.create!(quadrant_type: "Couple Bad Good", content: "Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")


###Questionnaire 5 EMOTIONAL DISENGAGEMENT AND LONELINESS###

emotional_loneliness = Questionnaire.create! title: "Emotional Disengagement and Loneliness", cutoff_score: 4 #score < 4 and it's a bad thing

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

emotional_loneliness.results.create!(quadrant_type: "Individual Good", content: "This Individual Scored Good - no problems")
emotional_loneliness.results.create!(quadrant_type: "Individual Ok", content: "This Individual Scored Ok - has some problems")
emotional_loneliness.results.create!(quadrant_type: "Individual Bad", content: "This Individual Scored Bad -has problems")
emotional_loneliness.results.create!(quadrant_type: "Couple Good", content: "Both Partners Scored Good - no problems")
emotional_loneliness.results.create!(quadrant_type: "Couple Bad", content: "Both Partners Scored Bad -both have problems")
emotional_loneliness.results.create!(quadrant_type: "Couple Good Bad", content: "Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
emotional_loneliness.results.create!(quadrant_type: "Couple Bad Good", content: "Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")
