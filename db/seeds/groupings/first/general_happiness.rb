###Questionnaire 1 GENERAL HAPPINESS###
module GeneralHappiness

  #Questionnaire#

  general_happiness = Questionnaire.create!(title: "General Relationship Happiness", cutoff_score: 55, ok_score: 60, weight: 0.2) #cutoff_score < 55 and it's a bad thing.

  #Grouping#
  
  general_happiness_grouping = Grouping.create!(name: "General Happiness")
  general_happiness_grouping.questionnaires << general_happiness

  #Questions#

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

  #PossibleResponses#

  agree_disagree = []
  (1..5).to_a.each {|num| agree_disagree << PossibleResponse.find(num)}

  general_happiness.questions.each do |question|
    agree_disagree.each do |response|
      question.possible_responses << response
    end
  end

  #Products#

  general_happiness_products = []

  general_happiness_products << Product.create!(name: "The Art & Science of Love", description: "Drawn from our four decades of research with over 3000 couples, the material in The Art & Science of Love rebuilds or increases the friendship, intimacy and respect in your relationship. Our lab and field work revealed exactly what separates the “masters” of relationships from the “disasters.” And that research enabled us to build a program that teaches everything we’ve learned about creating the kind of relationship we all hope for.")

  general_happiness_products << Product.create!(name: "Personalized Therapy Help", description: "A therapist! The very name makes you want cringe and reaffirm that your relationship is actually pretty good and that while maybe other couples might need professional help, you do not. Wrong. It's completely normal for couples in committed relationships to have issues that they need to work on. A therapist is like a doctor for your relationship and it's time for your yearly physical. Find one now:")

  #Results#

  general_happiness.results.create!(quadrant_type: "individual_good", overall: "good", content: "Congratulations, in general you are happy with your relationship!", recommendation: "Your relationship is a sense of strength to you but you already knew that. There are no recommendations, just keep doing what you're doing!") # You scored good - you have no problems in this area

  ok = general_happiness.results.create!(quadrant_type: "individual_ok", overall: "ok", content: "Don't panic but there are some things in general that you need to work on in your relationship.", recommendation: "In the first section of this test you took we diagnosed your general relationship happiness.  In one or more areas your score was not as high as we would have liked it to be. This could either be due to one or more specific issues that you and your partner have or because your relationship in general needs a little bit of work. If left unchecked these issues could eventually grown into much larger problems and lead to unhappiness and emotional distance. Don't worry though in researching relationships for over 40 years with thousands of couples we have created a play book to help you and your partner enhance all areas of your relationship. From skills for how to better deal with conflict to simple ways to stay more emotionally connected we can help point you in the right direction in terms of creating a lasting happy relationship. And it all starts with this:") # You scored ok - there are some issues you need to work on
  ok.products << general_happiness_products[0]

  bad = general_happiness.results.create!(quadrant_type: "individual_bad", overall: "bad", content: "In terms of general happiness your relationship is not in the place we want it to be.", recommendation: "The average amount of time that couples wait to get some sort of professional help with their relationship is 7 years. By that time there is so much resentment and negativity towards one another that it takes a lot to salvage the relationship. Don't become part of the growing statistic of divorced couples. If you really value your life together with your partner and want to work with them to rekindle the joy and passion that you two once had then it's time to face the facts and get some help. Of course it's also possible that you are reasonably happy but that you and your partner have a specific issue that you need to work on. In either case we recommend that you use the following resources in order to strengthen or repair your relationship before it's too late:") # You scored bad - you have problems
  general_happiness_products.each {|product| bad.products << product}

  general_happiness.results.create!(quadrant_type: "couple_good_good", overall: "good", content: "Congratulations, in general both you and your partner are happy with your relationship!", recommendation: "Your relationship is a sense of strength to both of you but you already knew that. There are no recommendations, just keep doing what you're doing!") # You both scored good - this relationship no problems

  bad = general_happiness.results.create!(quadrant_type: "couple_good_bad", overall: "bad", content: "Relationships are a team sport and your partner needs your help!", recommendation: "While you are reasonably happy in this relationship your partner is not and you need to work together with them in order to discover the source of their unhappiness. This unhappiness could either be due to a specific problem, such as a major personal difference, or because the relationship overall needs work. In either case while this might not seem like a big problem to you because you scored good overall, to your partner it is a big deal and something that they most likely spend a lot of time thinking about. Be a team player and work with them in order to understand what the issue is and how you two can resolve it. In order to most effectively do this we recommend that you use the following resources in order to strengthen or repair your relationship in a way that is proven to give results:") # You scored good your partner scored bad - your partner needs your help badly!
  general_happiness_products.each {|product| bad.products << product}

  ok = general_happiness.results.create!(quadrant_type: "couple_good_ok", overall: "ok", content: "You're almost there but your partner needs a little help from you.", recommendation: "Relationships are work and while you are pretty satisfied with how thing are going overall, your partner needs a little help from you in order to get on your level. This could either be due to one or more specific issues that you and your partner have or because your relationship in general needs a little bit of work. In either case while you might not be inclined care that much because you scored good, this is a potential issue for your partner and they need your help now in order to prevent larger problems from developing further down the road. On the upside, whatever the problem, it is not currently a big one and with a little bit of preventative action you and your partner can restore your relationship to it's glory days with the following resource:") # You scored good your partner scored ok - your partner has some issues that they need your help with
  ok.products << general_happiness_products[0]

  bad = general_happiness.results.create!(quadrant_type: "couple_bad_good", overall: "bad", content: "You and your partner really need to work on your relationship overall.", recommendation: "You already knew this but there are aspects of your relationship that make you really unhappy at times. These might be specific issues that you and your partner already know and discuss, or it could be the case that your relationship overall just needs some help. Either way it's going to be ok. Take a deep breath, we are here to help you come up with a plan to make things better by giving you and your partner the skills and tools necessary to address any issues in a constructive way. The important thing to note here is that because your partner scored well in terms of overall relationship satisfaction they might not understand how much these issues mean to you.  We want to help you come up with a plan for how to communicate your feelings to them in a way that will understand and embrace. In researching thousands of couples' relationships for over 40 years we have created a play book to help you and your partner enhance all areas of your relationship. From skills for how to better deal with conflict or past traumas to simple ways to stay more emotionally connected, we can help point you in the right direction in terms of creating a lasting happy relationship. To do so we highly recommend using the following resources:") # You scored bad your partner scored good - you have some things you need to work on and you need your partner's help
  general_happiness_products.each {|product| bad.products << product}

  bad = general_happiness.results.create!(quadrant_type: "couple_bad_bad", overall: "bad", content: "Both you and your partner really need to work on your relationship overall.", recommendation: "You already knew this but there are aspects of your relationship that make you both really unhappy at times. These might be specific issues that you and your partner already know and discuss, or it could be the case that your relationship overall just needs some help. Either way it's going to be ok. Take a deep breath, we are here to help you come up with a plan to make things better by giving you and your partner the skills and tools necessary to address any issues in a constructive way. In researching thousands of couples' relationships for over 40 years we have created a play book to help you and your partner enhance all areas of your relationship. From skills for how to better deal with conflict or past traumas to simple ways to stay more emotionally connected, we can help point you in the right direction in terms of creating a lasting happy relationship. To do so we highly recommend using the following resources:")# You both scored bad - you both have problems and need to work on this area
  general_happiness_products.each {|product| bad.products << product}

  bad = general_happiness.results.create!(quadrant_type: "couple_bad_ok", overall: "bad", content: "You and your partner really need to work on your relationship overall", recommendation: "You already knew this but there are aspects of your relationship that make you both really unhappy at times. These might be specific issues that you and your partner already know and discuss, or it could be the case that your relationship overall just needs some help. Either way it's going to be ok. Take a deep breath, we are here to help you come up with a plan to make things better by giving you and your partner the skills and tools necessary to address any issues in a constructive way. In researching thousands of couples' relationships for over 40 years we have created a play book to help you and your partner enhance all areas of your relationship. From skills for how to better deal with conflict or past traumas to simple ways to stay more emotionally connected, we can help point you in the right direction in terms of creating a lasting happy relationship. To do so we highly recommend using the following resources:") #You scored bad and your partner scored ok - you have some issues you need to work on and so does your partner to a lesser degree
  general_happiness_products.each {|product| bad.products << product}

  ok = general_happiness.results.create!(quadrant_type: "couple_ok_good", overall: "ok", content: "Don't panic but there are some things in general that you need to work on in your relationship", recommendation: "In the first section of this test you took we diagnosed your general relationship happiness.  In one or more areas your score was not a high as we would have liked it to be. This could either be due to one or more specific issues that you and your partner have or because your relationship in general needs a little bit of work. Don't worry though in researching relationships for over 40 years with thousands of couples we have created a play book to help you and your partner enhance all areas of your relationship. From skills for how to better deal with conflict to simple ways to stay more emotionally connected we can help point you in the right direction in terms of creating a lasting happy relationship. And it all starts with this:")# You scored ok and your partner scored good - you have some minor issues that you need your partner's help with
  ok.products << general_happiness_products[0]

  bad = general_happiness.results.create!(quadrant_type: "couple_ok_bad", overall: "bad", content: "You and your partner need to work on your relationship overall", recommendation: "You already knew this but there are aspects of your relationship that make you both unhappy at times. These might be specific issues that you and your partner already know and discuss, or it could be the case that your relationship overall just needs some help. Either way it's going to be ok. We are here to help you come up with a plan to make things better by giving you and your partner the skills and tools necessary to address any issues in a constructive way. In researching thousands of couples' relationships for over 40 years we have created a play book to help you and your partner enhance all areas of your relationship. From skills for how to better deal with conflict or past traumas to simple ways to stay more emotionally connected, we can help point you in the right direction in terms of creating a lasting happy relationship. To do so we highly recommend using the following resources:") # You scored ok and your partner scored bad - you have some minor issues and your partner has some major ones
  general_happiness_products.each {|product| bad.products << product}

  ok = general_happiness.results.create!(quadrant_type: "couple_ok_ok", overall: "ok", content: "You're both almost there but there are some issues that need to be addressed before we give your relationship a clean bill of health.", recommendation: "In the first section of this test you took we diagnosed general relationship happiness for both you and your partner.  In one or more areas partner scores were not as high as we would have liked them to be. This could either be due to one or more specific issues that you and your partner have or because your relationship in general needs a little bit of work. If left unchecked these issues could eventually grown into much larger problems and lead to unhappiness and emotional distance. Don't worry though in researching relationships for over 40 years with thousands of couples we have created a play book to help you and your partner enhance all areas of your relationship. From skills for how to better deal with conflict to simple ways to stay more emotionally connected we can help point you in the right direction in terms of creating a lasting happy relationship. And it all starts with this:") # You both scored just ok - there are some minor issues that need to be addressed for both of you
  ok.products << general_happiness_products[0]
end