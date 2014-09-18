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


###Questionnaire 3 FONDNESS AND ADMIRATION###

fondness_and_admiration = Questionnaire.create!(title: "Fondness and Admiration", cutoff_score: 4, ok_score: 5, weight: 0.1111) #cutoff_score < 4 and it's a bad thing

fondness_turning_emotion_grouping = Grouping.create!(name: "Last Section")
fondness_turning_emotion_grouping.questionnaires << fondness_and_admiration


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

fondness_and_admiration.results.create!(quadrant_type: "individual_good", overall: "g", content: "Congratulations, you have built a lasting friendship system in your relationship where you feel loved, respected, and appreciated!", recommendation: "From your answers it's clear that you feel respected, admired, and well loved by your partner. Most likely, you not only think loving and appreciative thoughts about them but also express those thoughts through words and affection. In doing so you are actively working to create a 'culture of appreciation' in your relationship, one where you don't feel taken for granted and where you are both proud of what you have accomplished. High fondness and admiration in a relationship is one of the three essential components of a good friendship, and you have it!") #You scored good - you have no problems in this area

ok = fondness_and_admiration.results.create!(quadrant_type: "individual_ok", overall: "o", content: "Don't panic, but we want you to do a better job of building a lasting friendship system in your relationship where you feel loved, respected, and appreciated.", recommendation: "In any committed relationship it's important to feel respected, admired, and well loved. We think you can do a better job of working with your partner to develop these fondness and admiration systems. In the case that you are not there, the goal of such a systems is to get to a point where you not only think loving and appreciative thoughts about your partner but also express those thoughts through words and affection. In doing so you will create a 'culture of appreciation' in your relationship, one where you don't feel taken for granted and where you are both proud of what you have accomplished. High fondness and admiration in a relationship is one of the three essential components of a good friendship, and we are worried that your current system has he potential to cause larger problem down the road. In order to enhance your friendship we recommend the following resource:") #You scored ok - you have some problems
ok.products << fondness_and_admiration_products[0]

bad = fondness_and_admiration.results.create!(quadrant_type: "individual_bad", overall: "b", content: "Don't panic, but we want you to do a better job of building a lasting friendship system in your relationship where you feel loved, respected, and appreciated.", recommendation: "In any committed relationship it's important to feel respected, admired, and well loved. We think you can do a better job of working with your partner to develop these fondness and admiration systems. In the case that you are not there, the goal of such a systems is to get to a point where you not only think loving and appreciative thoughts about your partner but also express those thoughts through words and affection. In doing so you will create a 'culture of appreciation' in your relationship, one where you don't feel taken for granted and where you are both proud of what you have accomplished. High fondness and admiration in a relationship is one of the three essential components of a good friendship, and we are worried that your current system is not supporting you a healthy way. In order to enhance your fondness and admiration systems we recommend the following resource:") #You scored bad - you have problems
fondness_and_admiration_products.each {|product| bad.products << product}

fondness_and_admiration.results.create!(quadrant_type: "couple_good_good", overall: "g", content: "Congratulations, you have built a lasting friendship system in your relationship where both you and your partner feel loved, respected, and appreciated!", recommendation: "From both of your answers it's clear that you feel respected, admired, and well loved by one another. Most likely you not only think loving and appreciative thoughts about each other but you also express these thoughts through words and affection. In doing so you are actively working to create a 'culture of appreciation' in your relationship, one where neither person feels taken for granted and where you are both proud of what you have accomplished. High fondness and admiration in a relationship is one of the three essential components of a good friendship, and you have it!") # You both scored good - this relationship no problems

bad = fondness_and_admiration.results.create!(quadrant_type: "couple_good_bad", overall: "b", content: "Your partner needs your help in building a lasting friendship system where they feel loved, respected, and appreciated.", recommendation: "In any committed relationship it's important to feel respected, admired, and well loved. We think you can do a better job of working with your partner to develop this fondness and admiration system in order to help them feel good about your relationship. Based on your partner's responses, chances are that currently they lack a sense that you are proud of what they have accomplished. Moreover they might even feel taken for granted. This can cause it to be hard for them to think loving and appreciative thoughts about you, and to express these thoughts through words and affection. A poor fondness and admiration system for either person in the relationship can be a significant problem for both your friendship and overall relationship. That said what you need to do now is work with them to develop a strong fondness and admiration system  since your current system is not supporting them a healthy way. In order to enhance your fondness and admiration systems we recommend the following resource:") #You scored good your partner scored bad - your partner needs your help badly!
fondness_and_admiration_products.each {|product| bad.products << product}

ok = fondness_and_admiration.results.create!(quadrant_type: "couple_good_ok", overall: "o", content: "", recommendation: "") # You scored good your partner scored ok - your partner has some issues that they need your help with
ok.products << fondness_and_admiration_products[0]

bad = fondness_and_admiration.results.create!(quadrant_type: "couple_bad_good", overall: "b", content: "", recommendation: "") # You scored bad your partner scored good - you have some things you need to work on and you need your partner's help
fondness_and_admiration_products.each {|product| bad.products << product}

bad = fondness_and_admiration.results.create!(quadrant_type: "couple_bad_bad", overall: "b", content: "", recommendation: "") # You both scored bad - you both have problems and need to work on this area
fondness_and_admiration_products.each {|product| bad.products << product}

bad = fondness_and_admiration.results.create!(quadrant_type: "couple_bad_ok", overall: "b", content: "", recommendation: "") # You scored bad and your partner scored ok - you have some issues you need to work on and so does your partner to a lesser degree
fondness_and_admiration_products.each {|product| bad.products << product}

ok = fondness_and_admiration.results.create!(quadrant_type: "couple_ok_good", overall: "o", content: "", recommendation: "") # You scored ok and your partner scored good - you have some minor issues that you need your partner's help with
ok.products << fondness_and_admiration_products[0]

bad = fondness_and_admiration.results.create!(quadrant_type: "couple_ok_bad", overall: "b", content: "", recommendation: "") # You scored ok and your partner scored bad - you have some minor issues and your partner has some major ones
fondness_and_admiration_products.each {|product| bad.products << product}

ok = fondness_and_admiration.results.create!(quadrant_type: "couple_ok_ok", overall: "o", content: "", recommendation: "") # Both Partners Scored Just Ok - there are some minor issues that need to be addressed
ok.products << fondness_and_admiration_products[0]



###Questionnaire 4 TURNING TOWARDS###

turning_towards = Questionnaire.create!(title: "Turning Towards", cutoff_score: 4, ok_score: 5, weight: 0.1111) #cutoff_score < 4 and it's a bad thing
Grouping.find(3).questionnaires << turning_towards

turning_towards.questions.create! content: "I really enjoy discussing things with my partner"
turning_towards.questions.create! content: "We always have a lot to say to each other"
turning_towards.questions.create! content: "We have a lot of fun together in our everyday lives"
turning_towards.questions.create! content: "My partner responds with engagement when I have interesting things to say"
turning_towards.questions.create! content: "We like to do a lot of the same things"


turning_towards.questions.each do |question|
  true_false_normal.each do |response|
    question.possible_responses << response
  end
end

turning_towards_products = []

turning_towards_products << Product.create!(name: "Gottman Turning Towards Product", description: "This product is designed to help your Turning Towards")
turning_towards_products << Product.create!(name: "Gottman Turning Towards Therapy Help", description: "Personalized therapy to help you with this problem")

turning_towards.results.create!(quadrant_type: "individual_good", overall: "g", content: "You scored good - you have no problems in this area", recommendation: "No recommendation you scored good in this area")

ok = turning_towards.results.create!(quadrant_type: "individual_ok", overall: "o", content: "You scored ok - you have some problems", recommendation: "Since you scored ok we recommend you use the following tool to help")
ok.products << turning_towards_products[0]

bad = turning_towards.results.create!(quadrant_type: "individual_bad", overall: "b", content: "You scored bad - you have problems", recommendation: "This area of your relationship needs work, we recommend the following tools")
turning_towards_products.each {|product| bad.products << product}

turning_towards.results.create!(quadrant_type: "couple_good_good", overall: "g", content: "You both scored good - this relationship no problems", recommendation: "You both scored good in this area there are no recommendations")

bad = turning_towards.results.create!(quadrant_type: "couple_good_bad", overall: "b", content: "You scored good your partner scored bad - your partner needs your help badly!", recommendation: "You scored good but your partner needs help in this area, we recommend the following two things.")
turning_towards_products.each {|product| bad.products << product}

ok = turning_towards.results.create!(quadrant_type: "couple_good_ok", overall: "o", content: "You scored good your partner scored ok - your partner has some issues that they need your help with", recommendation: "You scored good but your partner scored ok so we recommend the following exercise to help them.")
ok.products << turning_towards_products[0]

bad = turning_towards.results.create!(quadrant_type: "couple_bad_good", overall: "b", content: "You scored bad your partner scored good - you have some things you need to work on and you need your partner's help", recommendation: "This area of your relationship needs work, we recommend the following two things")
turning_towards_products.each {|product| bad.products << product}

bad = turning_towards.results.create!(quadrant_type: "couple_bad_bad", overall: "b", content: "You both scored bad - you both have problems and need to work on this area", recommendation: "Both you and your partner need to work on this area, we recommend you do the followign two things")
turning_towards_products.each {|product| bad.products << product}

bad = turning_towards.results.create!(quadrant_type: "couple_bad_ok", overall: "b", content: "You scored bad and your partner scored ok - you have some issues you need to work on and so does your partner to a lesser degree", recommendation: "You and your partner need to work on this area of your relationship, here are the tools we recommend")
turning_towards_products.each {|product| bad.products << product}

ok = turning_towards.results.create!(quadrant_type: "couple_ok_good", overall: "o", content: "You scored ok and your partner scored good - you have some minor issues that you need your partner's help with", recommendation: "You scored ok and we reccomend the following tool to help sharpen your skills")
ok.products << turning_towards_products[0]

bad = turning_towards.results.create!(quadrant_type: "couple_ok_bad", overall: "b", content: "You scored ok and your partner scored bad - you have some minor issues and your partner has some major ones", recommendation: "Both you and your partner need to work on this area of things, here are our recommendations")
turning_towards_products.each {|product| bad.products << product}

ok = turning_towards.results.create!(quadrant_type: "couple_ok_ok", overall: "o", content: "Both Partners Scored Just Ok - there are some minor issues that need to be addressed", recommendation: "Since both of you scored just ok we reccomend the following tool to help you out")
ok.products << turning_towards_products[0]


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

emotional_loneliness_products << Product.create!(name: "Gottman Emotional Lonliness Product", description: "This product is designed to help your Emotional Lonliness")
emotional_loneliness_products << Product.create!(name: "Gottman Emotional Lonliness Therapy Help", description: "Personalized therapy to help you with this problem")

emotional_loneliness.results.create!(quadrant_type: "individual_good", overall: "g", content: "You scored good - you have no problems in this area", recommendation: "No recommendation you scored good in this area")

ok = emotional_loneliness.results.create!(quadrant_type: "individual_ok", overall: "o", content: "You scored ok - you have some problems", recommendation: "Since you scored ok we recommend you use the following tool to help")
ok.products << emotional_loneliness_products[0]

bad = emotional_loneliness.results.create!(quadrant_type: "individual_bad", overall: "b", content: "You scored bad - you have problems", recommendation: "This area of your relationship needs work, we recommend the following tools")
emotional_loneliness_products.each {|product| bad.products << product}

emotional_loneliness.results.create!(quadrant_type: "couple_good_good", overall: "g", content: "You both scored good - this relationship no problems", recommendation: "You both scored good in this area there are no recommendations")

bad = emotional_loneliness.results.create!(quadrant_type: "couple_good_bad", overall: "b", content: "You scored good your partner scored bad - your partner needs your help badly!", recommendation: "You scored good but your partner needs help in this area, we recommend the following two things.")
emotional_loneliness_products.each {|product| bad.products << product}

ok = emotional_loneliness.results.create!(quadrant_type: "couple_good_ok", overall: "o", content: "You scored good your partner scored ok - your partner has some issues that they need your help with", recommendation: "You scored good but your partner scored ok so we recommend the following exercise to help them.")
ok.products << emotional_loneliness_products[0]

bad = emotional_loneliness.results.create!(quadrant_type: "couple_bad_good", overall: "b", content: "You scored bad your partner scored good - you have some things you need to work on and you need your partner's help", recommendation: "This area of your relationship needs work, we recommend the following two things")
emotional_loneliness_products.each {|product| bad.products << product}

bad = emotional_loneliness.results.create!(quadrant_type: "couple_bad_bad", overall: "b", content: "You both scored bad - you both have problems and need to work on this area", recommendation: "Both you and your partner need to work on this area, we recommend you do the followign two things")
emotional_loneliness_products.each {|product| bad.products << product}

bad = emotional_loneliness.results.create!(quadrant_type: "couple_bad_ok", overall: "b", content: "You scored bad and your partner scored ok - you have some issues you need to work on and so does your partner to a lesser degree", recommendation: "You and your partner need to work on this area of your relationship, here are the tools we recommend")
emotional_loneliness_products.each {|product| bad.products << product}

ok = emotional_loneliness.results.create!(quadrant_type: "couple_ok_good", overall: "o", content: "You scored ok and your partner scored good - you have some minor issues that you need your partner's help with", recommendation: "You scored ok and we reccomend the following tool to help sharpen your skills")
ok.products << emotional_loneliness_products[0]

bad = emotional_loneliness.results.create!(quadrant_type: "couple_ok_bad", overall: "b", content: "You scored ok and your partner scored bad - you have some minor issues and your partner has some major ones", recommendation: "Both you and your partner need to work on this area of things, here are our recommendations")
emotional_loneliness_products.each {|product| bad.products << product}

ok = emotional_loneliness.results.create!(quadrant_type: "couple_ok_ok", overall: "o", content: "Both Partners Scored Just Ok - there are some minor issues that need to be addressed", recommendation: "Since both of you scored just ok we reccomend the following tool to help you out")
ok.products << emotional_loneliness_products[0]


###Questionnaire 6 OVERALL SCORE### Note this is not an actual questionnaire, it is just a means of determining overall results

overall_state = Questionnaire.create!(title: "Overall Relationship Score", cutoff_score: 90, ok_score: 80)

overall_state_products = []

overall_state_products << Product.create!(name: "The ASL", description: "This product is designed to help your relationship overall")
overall_state_products << Product.create!(name: "Gottman Relationship Therapy Help", description: "Personalized therapy to help you with your relationship overall")

overall_state.results.create!(quadrant_type: "individual_good", overall: "g", content: "You scored good - you have no problems in this area", recommendation: "No recommendation you scored good in this area")

ok = overall_state.results.create!(quadrant_type: "individual_ok", overall: "o", content: "You scored ok - you have some problems", recommendation: "Since you scored ok we recommend you use the following tool to help")
ok.products << overall_state_products[0]

bad = overall_state.results.create!(quadrant_type: "individual_bad", overall: "b", content: "You scored bad - you have problems", recommendation: "This area of your relationship needs work, we recommend the following tools")
overall_state_products.each {|product| bad.products << product}

overall_state.results.create!(quadrant_type: "couple_good_good", overall: "g", content: "You both scored good - this relationship no problems", recommendation: "You both scored good in this area there are no recommendations")

bad = overall_state.results.create!(quadrant_type: "couple_good_bad", overall: "b", content: "You scored good your partner scored bad - your partner needs your help badly!", recommendation: "You scored good but your partner needs help in this area, we recommend the following two things.")
overall_state_products.each {|product| bad.products << product}

ok = overall_state.results.create!(quadrant_type: "couple_good_ok", overall: "o", content: "You scored good your partner scored ok - your partner has some issues that they need your help with", recommendation: "You scored good but your partner scored ok so we recommend the following exercise to help them.")
ok.products << overall_state_products[0]

bad = overall_state.results.create!(quadrant_type: "couple_bad_good", overall: "b", content: "You scored bad your partner scored good - you have some things you need to work on and you need your partner's help", recommendation: "This area of your relationship needs work, we recommend the following two things")
overall_state_products.each {|product| bad.products << product}

bad = overall_state.results.create!(quadrant_type: "couple_bad_bad", overall: "b", content: "You both scored bad - you both have problems and need to work on this area", recommendation: "Both you and your partner need to work on this area, we recommend you do the followign two things")
overall_state_products.each {|product| bad.products << product}

bad = overall_state.results.create!(quadrant_type: "couple_bad_ok", overall: "b", content: "You scored bad and your partner scored ok - you have some issues you need to work on and so does your partner to a lesser degree", recommendation: "You and your partner need to work on this area of your relationship, here are the tools we recommend")
overall_state_products.each {|product| bad.products << product}

ok = overall_state.results.create!(quadrant_type: "couple_ok_good", overall: "o", content: "You scored ok and your partner scored good - you have some minor issues that you need your partner's help with", recommendation: "You scored ok and we reccomend the following tool to help sharpen your skills")
ok.products << overall_state_products[0]

bad = overall_state.results.create!(quadrant_type: "couple_ok_bad", overall: "b", content: "You scored ok and your partner scored bad - you have some minor issues and your partner has some major ones", recommendation: "Both you and your partner need to work on this area of things, here are our recommendations")
overall_state_products.each {|product| bad.products << product}

ok = overall_state.results.create!(quadrant_type: "couple_ok_ok", overall: "o", content: "You both scored just ok - there are some minor issues that need to be addressed for both of you", recommendation: "Since both of you scored just ok we reccomend the following tool to help you out")
ok.products << overall_state_products[0]
