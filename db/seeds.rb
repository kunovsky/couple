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


###Questionnaire 5 EMOTIONAL DISENGAGEMENT AND LONELINESS###

emotional_loneliness = Questionnaire.create!(title: "Emotional Disengagement and Loneliness", cutoff_score: 4, ok_score: 5, weight: 0.1111) #cutoff_score < 4 and it's a bad thing
Grouping.find(3).questionnaires << emotional_loneliness

emotional_loneliness.questions.create! content: "I often find myself disappointed in this relationship"
emotional_loneliness.questions.create! content: "I will at times find myself quite lonely in this relationship"
emotional_loneliness.questions.create! content: "It is hard for my deepest feelings to get much attention in this relationship"
emotional_loneliness.questions.create! content: "There is not enough closeness between us"
emotional_loneliness.questions.create! content: "I have adapted to a lot in this relationship and I am not so sure it's a good idea"


emotional_loneliness.questions.each do |question|
  true_false_reversed.each do |response|
    question.possible_responses << response
  end
end

emotional_loneliness_products = []

emotional_loneliness_products << Product.create!(name: "Gottman Emotional Loneliness Product", description: "This product is designed to help your Emotional Loneliness")
emotional_loneliness_products << Product.create!(name: "Gottman Emotional Loneliness Therapy Help", description: "Personalized therapy to help you with this problem")

emotional_loneliness.results.create!(quadrant_type: "individual_good", overall: "g", content: "", recommendation: "")#You scored good - you have no problems in this area

ok = emotional_loneliness.results.create!(quadrant_type: "individual_ok", overall: "o", content: "", recommendation: "") # You scored ok - you have some problems
ok.products << emotional_loneliness_products[0]

bad = emotional_loneliness.results.create!(quadrant_type: "individual_bad", overall: "b", content: "", recommendation: "") # You scored bad - you have problems
emotional_loneliness_products.each {|product| bad.products << product}

emotional_loneliness.results.create!(quadrant_type: "couple_good_good", overall: "g", content: "", recommendation: "") # You both scored good - this relationship no problems

bad = emotional_loneliness.results.create!(quadrant_type: "couple_good_bad", overall: "b", content: "", recommendation: "") # You scored good your partner scored bad - your partner needs your help badly!
emotional_loneliness_products.each {|product| bad.products << product}

ok = emotional_loneliness.results.create!(quadrant_type: "couple_good_ok", overall: "o", content: "", recommendation: "") # You scored good your partner scored ok - your partner has some issues that they need your help with
ok.products << emotional_loneliness_products[0]

bad = emotional_loneliness.results.create!(quadrant_type: "couple_bad_good", overall: "b", content: "", recommendation: "") # You scored bad your partner scored good - you have some things you need to work on and you need your partner's help
emotional_loneliness_products.each {|product| bad.products << product}

bad = emotional_loneliness.results.create!(quadrant_type: "couple_bad_bad", overall: "b", content: "", recommendation: "") # You both scored bad - you both have problems and need to work on this area
emotional_loneliness_products.each {|product| bad.products << product}

bad = emotional_loneliness.results.create!(quadrant_type: "couple_bad_ok", overall: "b", content: "", recommendation: "") # You scored bad and your partner scored ok - you have some issues you need to work on and so does your partner to a lesser degree
emotional_loneliness_products.each {|product| bad.products << product}

ok = emotional_loneliness.results.create!(quadrant_type: "couple_ok_good", overall: "o", content: "", recommendation: "") #You scored ok and your partner scored good - you have some minor issues that you need your partner's help with
ok.products << emotional_loneliness_products[0]

bad = emotional_loneliness.results.create!(quadrant_type: "couple_ok_bad", overall: "b", content: "", recommendation: "") # You scored ok and your partner scored bad - you have some minor issues and your partner has some major ones
emotional_loneliness_products.each {|product| bad.products << product}

ok = emotional_loneliness.results.create!(quadrant_type: "couple_ok_ok", overall: "o", content: "", recommendation: "") #Both Partners Scored Just Ok - there are some minor issues that need to be addressed
ok.products << emotional_loneliness_products[0]


###Questionnaire 6 OVERALL SCORE### Note this is not an actual questionnaire, it is just a means of determining overall results

overall_state = Questionnaire.create!(title: "Overall Relationship Score", cutoff_score: 90, ok_score: 80)

overall_state_products = []

overall_state_products << Product.create!(name: "The ASL", description: "This product is designed to help your relationship overall")
overall_state_products << Product.create!(name: "Gottman Relationship Therapy Help", description: "Personalized therapy to help you with your relationship overall")

overall_state.results.create!(quadrant_type: "individual_good", overall: "g", content: "", recommendation: "")#You scored good - you have no problems in this area

ok = overall_state.results.create!(quadrant_type: "individual_ok", overall: "o", content: "", recommendation: "") # You scored ok - you have some problems
ok.products << overall_state_products[0]

bad = overall_state.results.create!(quadrant_type: "individual_bad", overall: "b", content: "", recommendation: "") # You scored bad - you have problems
overall_state_products.each {|product| bad.products << product}

overall_state.results.create!(quadrant_type: "couple_good_good", overall: "g", content: "", recommendation: "") # You both scored good - this relationship no problems

bad = overall_state.results.create!(quadrant_type: "couple_good_bad", overall: "b", content: "", recommendation: "") # You scored good your partner scored bad - your partner needs your help badly!
overall_state_products.each {|product| bad.products << product}

ok = overall_state.results.create!(quadrant_type: "couple_good_ok", overall: "o", content: "", recommendation: "") # You scored good your partner scored ok - your partner has some issues that they need your help with
ok.products << overall_state_products[0]

bad = overall_state.results.create!(quadrant_type: "couple_bad_good", overall: "b", content: "", recommendation: "") # You scored bad your partner scored good - you have some things you need to work on and you need your partner's help
overall_state_products.each {|product| bad.products << product}

bad = overall_state.results.create!(quadrant_type: "couple_bad_bad", overall: "b", content: "", recommendation: "") # You both scored bad - you both have problems and need to work on this area
overall_state_products.each {|product| bad.products << product}

bad = overall_state.results.create!(quadrant_type: "couple_bad_ok", overall: "b", content: "", recommendation: "") # You scored bad and your partner scored ok - you have some issues you need to work on and so does your partner to a lesser degree
overall_state_products.each {|product| bad.products << product}

ok = overall_state.results.create!(quadrant_type: "couple_ok_good", overall: "o", content: "", recommendation: "") #You scored ok and your partner scored good - you have some minor issues that you need your partner's help with
ok.products << overall_state_products[0]

bad = overall_state.results.create!(quadrant_type: "couple_ok_bad", overall: "b", content: "", recommendation: "") # You scored ok and your partner scored bad - you have some minor issues and your partner has some major ones
overall_state_products.each {|product| bad.products << product}

ok = overall_state.results.create!(quadrant_type: "couple_ok_ok", overall: "o", content: "", recommendation: "") # You both scored just ok - there are some minor issues that need to be addressed for both of you
ok.products << overall_state_products[0]
