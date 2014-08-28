#TODO: Split this into smaller files

###Test Users###
# User.create!(first_name: "Tyson")
# ActualResponse.create! user_id: 1

# User.create!(first_name: "Unhappy")
# bad_survey = {"1"=>{"1"=>"1", "2"=>"1", "3"=>"1", "4"=>"1", "5"=>"1", "6"=>"1", "7"=>"1", "8"=>"1", "9"=>"1", "10"=>"1", "11"=>"1", "12"=>"1", "13"=>"1", "14"=>"1", "15"=>"1"}, "2"=>{"16"=>"7", "17"=>"7", "18"=>"7", "19"=>"7", "20"=>"7", "21"=>"7", "22"=>"7", "23"=>"7", "24"=>"7", "25"=>"7", "26"=>"7", "27"=>"7", "28"=>"7", "29"=>"7", "30"=>"7"}, "3"=>{"31"=>"7", "32"=>"7", "33"=>"7", "34"=>"7", "35"=>"7"}, "4"=>{"36"=>"7", "37"=>"7", "38"=>"7", "39"=>"7", "40"=>"7"}, "5"=>{"41"=>"8", "42"=>"8", "43"=>"8", "44"=>"8", "45"=>"8"}}
# ActualResponse.create!(user_id: 2, responses: bad_survey)


# User.create! first_name: "Happy"
# happy_survey = {"1"=>{"1"=>"5", "2"=>"5", "3"=>"5", "4"=>"5", "5"=>"5", "6"=>"5", "7"=>"5", "8"=>"5", "9"=>"5", "10"=>"5", "11"=>"5", "12"=>"5", "13"=>"5", "14"=>"5", "15"=>"5"}, "2"=>{"16"=>"6", "17"=>"6", "18"=>"6", "19"=>"6", "20"=>"6", "21"=>"6", "22"=>"6", "23"=>"6", "24"=>"6", "25"=>"6", "26"=>"6", "27"=>"6", "28"=>"6", "29"=>"6", "30"=>"6"}, "3"=>{"31"=>"6", "32"=>"6", "33"=>"6", "34"=>"6", "35"=>"6"}, "4"=>{"36"=>"6", "38"=>"6", "39"=>"6", "37"=>"6", "40"=>"6"}, "5"=>{"41"=>"9", "42"=>"9", "43"=>"9", "44"=>"9", "45"=>"9"}}
# ActualResponse.create!(user_id: 3, responses: happy_survey)

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

general_happiness.results.create!(quadrant_type: "Individual Good", content: "This Individual Scored Good - no problems")
general_happiness.results.create!(quadrant_type: "Individual Ok", content: "This Individual Scored Ok - has some problems")
general_happiness.results.create!(quadrant_type: "Individual Bad", content: "This Individual Scored Bad -has problems")
general_happiness.results.create!(quadrant_type: "Couple Good Good", content: "Both Partners Scored Good - no problems")
general_happiness.results.create!(quadrant_type: "Couple Good Bad", content: "Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
general_happiness.results.create!(quadrant_type: "Couple Good Ok", content: "Partner 1 Scored Good Partner 2 Scored Ok - partner 2 has some issues that they need partner 1s help with")
general_happiness.results.create!(quadrant_type: "Couple Bad Good", content: "Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")
general_happiness.results.create!(quadrant_type: "Couple Bad Bad", content: "Both Partners Scored Bad -both have problems")
general_happiness.results.create!(quadrant_type: "Couple Bad Ok", content: "Partner 1 Scored Bad Partner 2 Scored Ok - partner 1 has serious issues and partner 2 has less serious issues")
general_happiness.results.create!(quadrant_type: "Couple Ok Good", content: "Partner 1 Scored Ok Partner 2 Scored Good - partner 1 has some issues that they need partner 2s help with")
general_happiness.results.create!(quadrant_type: "Couple Ok Bad", content: "Partner 1 Scored Ok Partner 2 Scored Bad - partner 2 has serious issues and partner 1 has less serious issues")
general_happiness.results.create!(quadrant_type: "Couple Ok Ok", content: "Both Partners Scored Just Ok - there are some minor issues that need to be addressed")

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

love_maps.results.create!(quadrant_type: "Individual Good", content: "This Individual Scored Good - no problems")
love_maps.results.create!(quadrant_type: "Individual Ok", content: "This Individual Scored Ok - has some problems")
love_maps.results.create!(quadrant_type: "Individual Bad", content: "This Individual Scored Bad -has problems")
love_maps.results.create!(quadrant_type: "Couple Good Good", content: "Both Partners Scored Good - no problems")
love_maps.results.create!(quadrant_type: "Couple Good Bad", content: "Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
love_maps.results.create!(quadrant_type: "Couple Good Ok", content: "Partner 1 Scored Good Partner 2 Scored Ok - partner 2 has some issues that they need partner 1s help with")
love_maps.results.create!(quadrant_type: "Couple Bad Good", content: "Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")
love_maps.results.create!(quadrant_type: "Couple Bad Bad", content: "Both Partners Scored Bad -both have problems")
love_maps.results.create!(quadrant_type: "Couple Bad Ok", content: "Partner 1 Scored Bad Partner 2 Scored Ok - partner 1 has serious issues and partner 2 has less serious issues")
love_maps.results.create!(quadrant_type: "Couple Ok Good", content: "Partner 1 Scored Ok Partner 2 Scored Good - partner 1 has some issues that they need partner 2s help with")
love_maps.results.create!(quadrant_type: "Couple Ok Bad", content: "Partner 1 Scored Ok Partner 2 Scored Bad - partner 2 has serious issues and partner 1 has less serious issues")
love_maps.results.create!(quadrant_type: "Couple Ok Ok", content: "Both Partners Scored Just Ok - there are some minor issues that need to be addressed")


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

fondness_and_admiration.results.create!(quadrant_type: "Individual Good", content: "This Individual Scored Good - no problems")
fondness_and_admiration.results.create!(quadrant_type: "Individual Ok", content: "This Individual Scored Ok - has some problems")
fondness_and_admiration.results.create!(quadrant_type: "Individual Bad", content: "This Individual Scored Bad -has problems")
fondness_and_admiration.results.create!(quadrant_type: "Couple Good Good", content: "Both Partners Scored Good - no problems")
fondness_and_admiration.results.create!(quadrant_type: "Couple Good Bad", content: "Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
fondness_and_admiration.results.create!(quadrant_type: "Couple Good Ok", content: "Partner 1 Scored Good Partner 2 Scored Ok - partner 2 has some issues that they need partner 1s help with")
fondness_and_admiration.results.create!(quadrant_type: "Couple Bad Good", content: "Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")
fondness_and_admiration.results.create!(quadrant_type: "Couple Bad Bad", content: "Both Partners Scored Bad -both have problems")
fondness_and_admiration.results.create!(quadrant_type: "Couple Bad Ok", content: "Partner 1 Scored Bad Partner 2 Scored Ok - partner 1 has serious issues and partner 2 has less serious issues")
fondness_and_admiration.results.create!(quadrant_type: "Couple Ok Good", content: "Partner 1 Scored Ok Partner 2 Scored Good - partner 1 has some issues that they need partner 2s help with")
fondness_and_admiration.results.create!(quadrant_type: "Couple Ok Bad", content: "Partner 1 Scored Ok Partner 2 Scored Bad - partner 2 has serious issues and partner 1 has less serious issues")
fondness_and_admiration.results.create!(quadrant_type: "Couple Ok Ok", content: "Both Partners Scored Just Ok - there are some minor issues that need to be addressed")



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

turning_towards.results.create!(quadrant_type: "Individual Good", content: "This Individual Scored Good - no problems")
turning_towards.results.create!(quadrant_type: "Individual Ok", content: "This Individual Scored Ok - has some problems")
turning_towards.results.create!(quadrant_type: "Individual Bad", content: "This Individual Scored Bad -has problems")
turning_towards.results.create!(quadrant_type: "Couple Good Good", content: "Both Partners Scored Good - no problems")
turning_towards.results.create!(quadrant_type: "Couple Good Bad", content: "Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
turning_towards.results.create!(quadrant_type: "Couple Good Ok", content: "Partner 1 Scored Good Partner 2 Scored Ok - partner 2 has some issues that they need partner 1s help with")
turning_towards.results.create!(quadrant_type: "Couple Bad Good", content: "Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")
turning_towards.results.create!(quadrant_type: "Couple Bad Bad", content: "Both Partners Scored Bad -both have problems")
turning_towards.results.create!(quadrant_type: "Couple Bad Ok", content: "Partner 1 Scored Bad Partner 2 Scored Ok - partner 1 has serious issues and partner 2 has less serious issues")
turning_towards.results.create!(quadrant_type: "Couple Ok Good", content: "Partner 1 Scored Ok Partner 2 Scored Good - partner 1 has some issues that they need partner 2s help with")
turning_towards.results.create!(quadrant_type: "Couple Ok Bad", content: "Partner 1 Scored Ok Partner 2 Scored Bad - partner 2 has serious issues and partner 1 has less serious issues")
turning_towards.results.create!(quadrant_type: "Couple Ok Ok", content: "Both Partners Scored Just Ok - there are some minor issues that need to be addressed")



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

emotional_loneliness.results.create!(quadrant_type: "Individual Good", content: "This Individual Scored Good - no problems")
emotional_loneliness.results.create!(quadrant_type: "Individual Ok", content: "This Individual Scored Ok - has some problems")
emotional_loneliness.results.create!(quadrant_type: "Individual Bad", content: "This Individual Scored Bad -has problems")
emotional_loneliness.results.create!(quadrant_type: "Couple Good Good", content: "Both Partners Scored Good - no problems")
emotional_loneliness.results.create!(quadrant_type: "Couple Good Bad", content: "Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
emotional_loneliness.results.create!(quadrant_type: "Couple Good Ok", content: "Partner 1 Scored Good Partner 2 Scored Ok - partner 2 has some issues that they need partner 1s help with")
emotional_loneliness.results.create!(quadrant_type: "Couple Bad Good", content: "Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")
emotional_loneliness.results.create!(quadrant_type: "Couple Bad Bad", content: "Both Partners Scored Bad -both have problems")
emotional_loneliness.results.create!(quadrant_type: "Couple Bad Ok", content: "Partner 1 Scored Bad Partner 2 Scored Ok - partner 1 has serious issues and partner 2 has less serious issues")
emotional_loneliness.results.create!(quadrant_type: "Couple Ok Good", content: "Partner 1 Scored Ok Partner 2 Scored Good - partner 1 has some issues that they need partner 2s help with")
emotional_loneliness.results.create!(quadrant_type: "Couple Ok Bad", content: "Partner 1 Scored Ok Partner 2 Scored Bad - partner 2 has serious issues and partner 1 has less serious issues")
emotional_loneliness.results.create!(quadrant_type: "Couple Ok Ok", content: "Both Partners Scored Just Ok - there are some minor issues that need to be addressed")


###Questionnaire 6 OVERALL SCORE### Note this is not an actual questionnaire, it is just a means of determining overall results

overall_state = Questionnaire.create!(title: "Overall Relationship Score", cutoff_score: 90, ok_score: 80)

overall_state.results.create!(quadrant_type: "Individual Good", content: "Overall This Individual Scored Good - no problems")
overall_state.results.create!(quadrant_type: "Individual Ok", content: "Overall This Individual Scored Ok - has some problems")
overall_state.results.create!(quadrant_type: "Individual Bad", content: "Overall This Individual Scored Bad -has problems")
overall_state.results.create!(quadrant_type: "Couple Good Good", content: "Overall Both Partners Scored Good - no problems")
overall_state.results.create!(quadrant_type: "Couple Good Bad", content: "Overall Partner 1 Scored Good Partner 2 Scored Bad - partner 2 has problems")
overall_state.results.create!(quadrant_type: "Couple Good Ok", content: "Overall Partner 1 Scored Good Partner 2 Scored Ok - partner 2 has some issues that they need partner 1s help with")
overall_state.results.create!(quadrant_type: "Couple Bad Good", content: "Overall Partner 1 Scored Bad Partner 2 Scored Good - partner 1 has problems")
overall_state.results.create!(quadrant_type: "Couple Bad Bad", content: "Overall Both Partners Scored Bad -both have problems")
overall_state.results.create!(quadrant_type: "Couple Bad Ok", content: "Overall Partner 1 Scored Bad Partner 2 Scored Ok - partner 1 has serious issues and partner 2 has less serious issues")
overall_state.results.create!(quadrant_type: "Couple Ok Good", content: "Overall Partner 1 Scored Ok Partner 2 Scored Good - partner 1 has some issues that they need partner 2s help with")
overall_state.results.create!(quadrant_type: "Couple Ok Bad", content: "Overall Partner 1 Scored Ok Partner 2 Scored Bad - partner 2 has serious issues and partner 1 has less serious issues")
overall_state.results.create!(quadrant_type: "Couple Ok Ok", content: "Overall Both Partners Scored Just Ok - there are some minor issues that need to be addressed")

=begin 

what do you need to do as a result of getting this score, what is your treatment?

For each section:

#individual#
good = do nothing
ok = a gottman exercise
bad = see a therapist and gottman products (book a therapist in your area)

#couple#

good good = do nothing
good ok = a gottman exercise for both couples to do
good bad = see a therapist and gottman products

ok good = a gottman exercise for both couples to do
ok ok = a gottman exercise for both couples to do
ok bad = see a therapist and gottman products

bad good = see a therapist and gottman products
bad ok = see a therapist and gottman products
bad bad see a therapist and gottman products

And then overall:

good good = do nothing
good ok = a gottman exercise for both couples to do
good bad = see a therapist and gottman products

ok good = a gottman exercise for both couples to do
ok ok = a gottman exercise for both couples to do
ok bad = see a therapist and gottman products

bad good = see a therapist and gottman products
bad ok = see a therapist and gottman products
bad bad see a therapist and gottman products

=end


