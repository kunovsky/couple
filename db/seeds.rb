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

general_happiness = Questionnaire.create!(title: "General Relationship Happiness", cutoff_score: 55, ok_score: 60, weight: 0.3333) #cutoff_score < 55 and it's a bad thing.

general_happiness_grouping = Grouping.create!(name: "General Happiness")
general_happiness_grouping.questionnaires << general_happiness

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
general_happiness_products << Product.create!(name: "Find a therapist in your area", description: "A therapist! The very name makes you want cringe and reaffirm that your relationship is actually pretty good and that while maybe other couples might need professional help, you do not. Wrong. It’s completely normal for couples in committed relationships to have issues that they need to work on. A therapist is like a doctor for your relationship and it’s time for your yearly physical. Find one now:")

general_happiness.results.create!(quadrant_type: "individual_good", overall: "g", content: "Congratulations, in general you are happy with your relationship!", recommendation: "Your relationship is a sense of strength to you but you alread knew that. There are no recommendations, just keep doing what you’re doing!") # You scored good - you have no problems in this area

ok = general_happiness.results.create!(quadrant_type: "individual_ok", overall: "o", content: "Don't panic but there are some things in general that you need to work on in your relationship.", recommendation: "In the first section of this test you took we diagnosed your general relationship happiness.  In one or more areas your score was not as high as we would have liked it to be. This could either be due to one or more specific issues that you and your partner have or because your relationship in general needs a little bit of work. If left unchecked these issues could eventually grown into much larger problems and lead to unhappiness and emotional distance. Don’t worry though in researching relationships for over 40 years with thousands of couples we have created a play book to help you and your partner enhance all areas of your relationship. From skills for how to better deal with conflict to simple ways to stay more emotionally connected we can help point you in the right direction in terms of creating a lasting happy relationship. And it all starts with this:") # You scored ok - there are some issues you need to work on
ok.products << general_happiness_products[0]

bad = general_happiness.results.create!(quadrant_type: "individual_bad", overall: "b", content: "In terms of general happiness your relationship is not in the place we want it to be.", recommendation: "The average amount of time that couples wait to get some sort of professional help with their relationship is 7 years. By that time there is so much resentment and negativity towards one another that it takes a lot to salvage the relationship. Don’t become part of the growing statistic of divorced couples. If you really value your life together with your partner and want to work with tem to rekindle the joy and passion that you two once had then it’s time to face the facts and get some help. Of course it’s also possible that you are reasonably happy but that you and your partner have a specific issue that you need to work on. In either case we recommend that you use the following resources in order to strengthen or repair your relationship before it’s too late:") # You scored bad - you have problems
general_happiness_products.each {|product| bad.products << product}

general_happiness.results.create!(quadrant_type: "couple_good_good", overall: "g", content: "Congratulations, in general both you and your partner are happy with your relationship!", recommendation: "Your relationship is a sense of strength to both of you but you already knew that. There are no recommendations, just keep doing what you’re doing!") # You both scored good - this relationship no problems

bad = general_happiness.results.create!(quadrant_type: "couple_good_bad", overall: "b", content: "Relationships are a team sport and your partner needs your help!", recommendation: "While you are reasonably happy in this relationship your partner is not and you need to work together with them in order to discover the source of their unhappiness. This unhappiness could either be due to a specific problem, such as a major personal difference, or because the relationship overall needs work. In either case while this might not seem like a big problem to you because you scored good overall, to your partner it is a big deal and something that they most likely spend a lot of time thinking about. Be a team player and work with them in order to understand what the issue is and how you two can resolve it. In order to most effectively do this we recommend that you use the following resources in order to strengthen or repair your relationship in a way that is proven to give results:") # You scored good your partner scored bad - your partner needs your help badly!
general_happiness_products.each {|product| bad.products << product}

ok = general_happiness.results.create!(quadrant_type: "couple_good_ok", overall: "o", content: "You’re almost there but your partner needs a little help from you.", recommendation: "Relationships are work and while you are pretty satisfied with how thing are going overall, your partner needs a little help from you in order to get on your level. This could either be due to one or more specific issues that you and your partner have or because your relationship in general needs a little bit of work. In either case while you might not be inclined care that much because you scored good, this is a potential issue for your partner and they need your help now in order to prevent larger problems from developing further down the road. On the upside, whatever the problem, it is not currently a big one and with a little bit of preventative action you and your partner can restore your relationship to it’s glory days with the following resource:") # You scored good your partner scored ok - your partner has some issues that they need your help with
ok.products << general_happiness_products[0]

bad = general_happiness.results.create!(quadrant_type: "couple_bad_good", overall: "b", content: "You and your partner really need to work on your relationship overall.", recommendation: "You already knew this but there are aspects of your relationship that make you really unhappy at times. These might be specific issues that you and your partner already know and discuss, or it could be the case that your relationship overall just needs some help. Either way it’s going to be ok. Take a deep breath, we are here to help you come up with a plan to make things better by giving you and your partner the skills and tools necessary to address any issues in a constructive way. The important thing to note here is that because your partner scored well in terms of overall relationship satisfaction they might not understand how much these issues mean to you.  We want to help you come up with a plan for how to communicate your feelings to them in a way that will understand and embrace. In researching thousands of couples’ relationships for over 40 years we have created a play book to help you and your partner enhance all areas of your relationship. From skills for how to better deal with conflict or past traumas to simple ways to stay more emotionally connected, we can help point you in the right direction in terms of creating a lasting happy relationship. To do so we highly recommend using the following resources:") # You scored bad your partner scored good - you have some things you need to work on and you need your partner's help
general_happiness_products.each {|product| bad.products << product}

bad = general_happiness.results.create!(quadrant_type: "couple_bad_bad", overall: "b", content: "Both you and your partner really need to work on your relationship overall.", recommendation: "You already knew this but there are aspects of your relationship that make you both really unhappy at times. These might be specific issues that you and your partner already know and discuss, or it could be the case that your relationship overall just needs some help. Either way it’s going to be ok. Take a deep breath, we are here to help you come up with a plan to make things better by giving you and your partner the skills and tools necessary to address any issues in a constructive way. In researching thousands of couples’ relationships for over 40 years we have created a play book to help you and your partner enhance all areas of your relationship. From skills for how to better deal with conflict or past traumas to simple ways to stay more emotionally connected, we can help point you in the right direction in terms of creating a lasting happy relationship. To do so we highly recommend using the following resources:")# You both scored bad - you both have problems and need to work on this area
general_happiness_products.each {|product| bad.products << product}

bad = general_happiness.results.create!(quadrant_type: "couple_bad_ok", overall: "b", content: "You and your partner really need to work on your relationship overall", recommendation: "You already knew this but there are aspects of your relationship that make you both really unhappy at times. These might be specific issues that you and your partner already know and discuss, or it could be the case that your relationship overall just needs some help. Either way it’s going to be ok. Take a deep breath, we are here to help you come up with a plan to make things better by giving you and your partner the skills and tools necessary to address any issues in a constructive way. In researching thousands of couples’ relationships for over 40 years we have created a play book to help you and your partner enhance all areas of your relationship. From skills for how to better deal with conflict or past traumas to simple ways to stay more emotionally connected, we can help point you in the right direction in terms of creating a lasting happy relationship. To do so we highly recommend using the following resources:") #You scored bad and your partner scored ok - you have some issues you need to work on and so does your partner to a lesser degree
general_happiness_products.each {|product| bad.products << product}

ok = general_happiness.results.create!(quadrant_type: "couple_ok_good", overall: "o", content: "Don't panic but there are some things in general that you need to work on in your relationship", recommendation: "In the first section of this test you took we diagnosed your general relationship happiness.  In one or more areas your score was not a high as we would have liked it to be. This could either be due to one or more specific issues that you and your partner have or because your relationship in general needs a little bit of work. Don’t worry though in researching relationships for over 40 years with thousands of couples we have created a play book to help you and your partner enhance all areas of your relationship. From skills for how to better deal with conflict to simple ways to stay more emotionally connected we can help point you in the right direction in terms of creating a lasting happy relationship. And it all starts with this:")# You scored ok and your partner scored good - you have some minor issues that you need your partner's help with
ok.products << general_happiness_products[0]

bad = general_happiness.results.create!(quadrant_type: "couple_ok_bad", overall: "b", content: "You and your partner need to work on your relationship overall", recommendation: "You already knew this but there are aspects of your relationship that make you both unhappy at times. These might be specific issues that you and your partner already know and discuss, or it could be the case that your relationship overall just needs some help. Either way it’s going to be ok. We are here to help you come up with a plan to make things better by giving you and your partner the skills and tools necessary to address any issues in a constructive way. In researching thousands of couples’ relationships for over 40 years we have created a play book to help you and your partner enhance all areas of your relationship. From skills for how to better deal with conflict or past traumas to simple ways to stay more emotionally connected, we can help point you in the right direction in terms of creating a lasting happy relationship. To do so we highly recommend using the following resources:") # You scored ok and your partner scored bad - you have some minor issues and your partner has some major ones
general_happiness_products.each {|product| bad.products << product}

ok = general_happiness.results.create!(quadrant_type: "couple_ok_ok", overall: "o", content: "You’re both almost there but there are some issues that need to be addressed before we give your relationship a clean bill of health.", recommendation: "In the first section of this test you took we diagnosed general relationship happiness for both you and your partner.  In one or more areas partner scores were not as high as we would have liked them to be. This could either be due to one or more specific issues that you and your partner have or because your relationship in general needs a little bit of work. If left unchecked these issues could eventually grown into much larger problems and lead to unhappiness and emotional distance. Don’t worry though in researching relationships for over 40 years with thousands of couples we have created a play book to help you and your partner enhance all areas of your relationship. From skills for how to better deal with conflict to simple ways to stay more emotionally connected we can help point you in the right direction in terms of creating a lasting happy relationship. And it all starts with this:") # You both scored just ok - there are some minor issues that need to be addressed for both of you
ok.products << general_happiness_products[0]

### Questionnaire 2 LOVEMAPS###

love_maps = Questionnaire.create!(title: "Love Maps", cutoff_score: 12, ok_score: 14, weight: 0.3333) #cutoff_score < 12 and it's a bad thing

love_maps_grouping = Grouping.create!(name: "Love Maps")
love_maps_grouping.questionnaires << love_maps


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

love_maps_products << Product.create!(name: "Gottman Love Maps App", description: "Research shows that a powerful predictor of relationship stability is whether couples allocate 'mental room' for their partner’s world. This means having a mental map of the relationship and its history, and knowing each partner’s past and present concerns, preferences, experiences and reality.  Make your ‘map’ with these cards -they bring you closer by getting to know each other in ways you may not have realized were important.  Love Map and Open-Ended Question Cards enable partners to connect emotionally, and increase intimacy and understanding in a fun, gentle way.")
love_maps_products << Product.create!(name: "Gottman Love Maps Therapy Help", description: "Personalized therapy to help you with this problem")

love_maps.results.create!(quadrant_type: "individual_good", overall: "g", content: "Congratulations, you have an excellent understanding of your partner and their internal world!", recommendation: "We call the idea of knowing your partner ‘Love Mapping’ and it is a big strength in your relationship. Love Mapping is more than simply knowing their favorite food or type of movie – it’s a continual download of your partner’s inner world into your brain.  Knowing what their stressors are, their current worries, their major fears (and continuously updating that knowledge).  And it is fundamentally important to having both good friendship and a good relationship overall. Make sure to constantly update your love maps by asking your partner open ended questions about their life.") # you scored good - no problems

ok = love_maps.results.create!(quadrant_type: "individual_ok", overall: "o", content: "You know your partner’s life and inner world pretty well, but you think you can do better.", recommendation: "We call the idea of knowing your partner ‘Love Mapping’ and it’s an important part of having close friendship and a good relationship overall. Love Mapping is more than simply knowing their favorite food or type of movie – it’s a continuous download of your partner’s inner world into your brain. Knowing the relevant information about your partner, such as their worries, hopes, and goals in life; their history; and the facts and feelings that constitute their being is extremely important. Happy couples use their love maps to express not only their understanding of each other, but their fondness and admiration as well. In an effort to better understand your partner, we strongly suggest the following resources:")# you scored ok -- you need to learn your partner's love maps better
ok.products << love_maps_products[0]

bad = love_maps.results.create!(quadrant_type: "individual_bad", overall: "b", content: "We want you to do a better job of learning about your partner and their inner world.", recommendation: "This area of your relationship needs work, we recommend the following tools") # you scored bad -- you have problems
love_maps_products.each {|product| bad.products << product}

love_maps.results.create!(quadrant_type: "couple_good_good", overall: "g", content: "You both scored good - this relationship no problems", recommendation: "You both scored good in this area there are no recommendations")

bad = love_maps.results.create!(quadrant_type: "couple_good_bad", overall: "b", content: "You scored good your partner scored bad - your partner needs your help badly!", recommendation: "You scored good but your partner needs help in this area, we recommend the following two things.")
love_maps_products.each {|product| bad.products << product}

ok = love_maps.results.create!(quadrant_type: "couple_good_ok", overall: "o", content: "You scored good your partner scored ok - your partner has some issues that they need your help with", recommendation: "You scored good but your partner scored ok so we recommend the following exercise to help them.")
ok.products << love_maps_products[0]

bad = love_maps.results.create!(quadrant_type: "couple_bad_good", overall: "b", content: "You scored bad your partner scored good - you have some things you need to work on and you need your partner's help", recommendation: "This area of your relationship needs work, we recommend the following two things")
love_maps_products.each {|product| bad.products << product}

bad = love_maps.results.create!(quadrant_type: "couple_bad_bad", overall: "b", content: "You both scored bad - you both have problems and need to work on this area", recommendation: "Both you and your partner need to work on this area, we recommend you do the followign two things")
love_maps_products.each {|product| bad.products << product}

bad = love_maps.results.create!(quadrant_type: "couple_bad_ok", overall: "b", content: "You scored bad and your partner scored ok - you have some issues you need to work on and so does your partner to a lesser degree", recommendation: "You and your partner need to work on this area of your relationship, here are the tools we recommend")
love_maps_products.each {|product| bad.products << product}

ok = love_maps.results.create!(quadrant_type: "couple_ok_good", overall: "o", content: "You scored ok and your partner scored good - you have some minor issues that you need your partner's help with", recommendation: "You scored ok and we reccomend the following tool to help sharpen your skills")
ok.products << love_maps_products[0]

bad = love_maps.results.create!(quadrant_type: "couple_ok_bad", overall: "b", content: "You scored ok and your partner scored bad - you have some minor issues and your partner has some major ones", recommendation: "Both you and your partner need to work on this area of things, here are our recommendations")
love_maps_products.each {|product| bad.products << product}

ok = love_maps.results.create!(quadrant_type: "couple_ok_ok", overall: "o", content: "You both scored just ok - there are some minor issues that need to be addressed for both of you", recommendation: "Since both of you scored just ok we reccomend the following tool to help you out")
ok.products << love_maps_products[0]


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

fondness_and_admiration.results.create!(quadrant_type: "individual_good", overall: "g", content: "You scored good - you have no problems in this area", recommendation: "No recommendation you scored good in this area")

ok = fondness_and_admiration.results.create!(quadrant_type: "individual_ok", overall: "o", content: "You scored ok - you have some problems", recommendation: "Since you scored ok we recommend you use the following tool to help")
ok.products << fondness_and_admiration_products[0]

bad = fondness_and_admiration.results.create!(quadrant_type: "individual_bad", overall: "b", content: "You scored bad - you have problems", recommendation: "This area of your relationship needs work, we recommend the following tools")
fondness_and_admiration_products.each {|product| bad.products << product}

fondness_and_admiration.results.create!(quadrant_type: "couple_good_good", overall: "g", content: "You both scored good - this relationship no problems", recommendation: "You both scored good in this area there are no recommendations")

bad = fondness_and_admiration.results.create!(quadrant_type: "couple_good_bad", overall: "b", content: "You scored good your partner scored bad - your partner needs your help badly!", recommendation: "You scored good but your partner needs help in this area, we recommend the following two things.")
fondness_and_admiration_products.each {|product| bad.products << product}

ok = fondness_and_admiration.results.create!(quadrant_type: "couple_good_ok", overall: "o", content: "You scored good your partner scored ok - your partner has some issues that they need your help with", recommendation: "You scored good but your partner scored ok so we recommend the following exercise to help them.")
ok.products << fondness_and_admiration_products[0]

bad = fondness_and_admiration.results.create!(quadrant_type: "couple_bad_good", overall: "b", content: "You scored bad your partner scored good - you have some things you need to work on and you need your partner's help", recommendation: "This area of your relationship needs work, we recommend the following two things")
fondness_and_admiration_products.each {|product| bad.products << product}

bad = fondness_and_admiration.results.create!(quadrant_type: "couple_bad_bad", overall: "b", content: "You both scored bad - you both have problems and need to work on this area", recommendation: "Both you and your partner need to work on this area, we recommend you do the followign two things")
fondness_and_admiration_products.each {|product| bad.products << product}

bad = fondness_and_admiration.results.create!(quadrant_type: "couple_bad_ok", overall: "b", content: "You scored bad and your partner scored ok - you have some issues you need to work on and so does your partner to a lesser degree", recommendation: "You and your partner need to work on this area of your relationship, here are the tools we recommend")
fondness_and_admiration_products.each {|product| bad.products << product}

ok = fondness_and_admiration.results.create!(quadrant_type: "couple_ok_good", overall: "o", content: "You scored ok and your partner scored good - you have some minor issues that you need your partner's help with", recommendation: "You scored ok and we reccomend the following tool to help sharpen your skills")
ok.products << fondness_and_admiration_products[0]

bad = fondness_and_admiration.results.create!(quadrant_type: "couple_ok_bad", overall: "b", content: "You scored ok and your partner scored bad - you have some minor issues and your partner has some major ones", recommendation: "Both you and your partner need to work on this area of things, here are our recommendations")
fondness_and_admiration_products.each {|product| bad.products << product}

ok = fondness_and_admiration.results.create!(quadrant_type: "couple_ok_ok", overall: "o", content: "Both Partners Scored Just Ok - there are some minor issues that need to be addressed", recommendation: "Since both of you scored just ok we reccomend the following tool to help you out")
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
emotional_loneliness.questions.create! content: "I have adapted to a lot in this relationship and I am not so sure it’s a good idea"


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
