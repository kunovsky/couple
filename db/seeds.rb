User.create(first_name: "Tyson")

###SURVEY 1 OVERALL HAPPINESS###

overall_happiness = Survey.create! title: "Overall Happiness", cutoff_score: 55

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
  question.possible_responses.create! content: "Strongly Disagree", point_value: 1
  question.possible_responses.create! content: "Disagree", point_value: 2
  question.possible_responses.create! content: "Neutral", point_value: 3
  question.possible_responses.create! content: "Agree", point_value: 4
  question.possible_responses.create! content: "Strongly Agree", point_value: 5
end


### SURVEY 2 LOVEMAPS###

love_maps = Survey.create! title: "Love Maps", cutoff_score: 6

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
  question.possible_responses.create! content: "True", point_value: 0
  question.possible_responses.create! content: "False", point_value: 1
end

###SURVEY 3 FONDNESS AND ADMIRATION###

fondness_and_admiration = Survey.create! title: "Fondness and Admiration", cutoff_score: 2

fondness_and_admiration.questions.create! content: "My partner really respects me"
fondness_and_admiration.questions.create! content: "I feel loved and cared for in this relationship"
fondness_and_admiration.questions.create! content: "Romance is something our relationship definitely still has in it"
fondness_and_admiration.questions.create! content: "When I come into a room my partner is glad to see me"
fondness_and_admiration.questions.create! content: "My partner appreciates the things I do in this relationship"


fondness_and_admiration.questions.each do |question|
  question.possible_responses.create! content: "True", point_value: 0
  question.possible_responses.create! content: "False", point_value: 1
end


###SURVEY 4 TURNING TOWARDS###

turning_towards = Survey.create! title: "Turning Towards", cutoff_score: 2

turning_towards.questions.create! content: "I really enjoy discussing things with my partner"
turning_towards.questions.create! content: "We always have a lot to say to each other"
turning_towards.questions.create! content: "We have a lot of fun together in our everyday lives"
turning_towards.questions.create! content: "My partner responds with interest when I have interesting things to say"
turning_towards.questions.create! content: "We like to do a lot of the same things"


turning_towards.questions.each do |question|
  question.possible_responses.create! content: "True", point_value: 0
  question.possible_responses.create! content: "False", point_value: 1
end


###SURVEY 5 EMOTIONAL DISENGAGEMENT AND LONELINESS###

emotional_loneliness = Survey.create! title: "Emotional Disengagement and Loneliness", cutoff_score: 3

emotional_loneliness.questions.create! content: "I often find myself disappointed in this relationship"
emotional_loneliness.questions.create! content: "I will at times find myself quite lonely in this relationship"
emotional_loneliness.questions.create! content: "It is hard for my deepest feelings to get much attention in this relationship"
emotional_loneliness.questions.create! content: "There is not enough closeness between us"
emotional_loneliness.questions.create! content: "I have adapted to a lot in this relationship and I am not so sure it’s a good idea"


emotional_loneliness.questions.each do |question|
  question.possible_responses.create! content: "True", point_value: 1
  question.possible_responses.create! content: "False", point_value: 0
end