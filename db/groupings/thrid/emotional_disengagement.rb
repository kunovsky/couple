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

emotional_loneliness_products << Product.create!(name: "Take another questionnaire to help us figure out the exact nature of this issue", description: "give them more questions, or let them select reasons as to why they feel this way.")
emotional_loneliness_products << Product.create!(name: "Find a therapist near you", description: "PA therapist! The very name makes you want cringe and reaffirm that your relationship is actually pretty good and that while maybe other couples might need professional help, you do not. Wrong. It's completely normal for couples in committed relationships to have issues that they need to work on. A therapist is like a doctor for your relationship and it's time for your yearly physical. Find one now:")

emotional_loneliness.results.create!(quadrant_type: "individual_good", overall: "g", content: "Congratulations, you are engaged and connected in your relationship and have created a good balance between dependence and interdependence.", recommendation: "From your answers it is clear that you are engaged with you partner and not feeling lonely in your relationship. This means that you can usually count on them when you have a need to connect. Furthermore you feel that you are a major priority in their life. Negotiating this balance of dependence and interdependence can be difficult for some couples but you two have nailed it, well done.")#You scored good - you have no problems in this area

ok = emotional_loneliness.results.create!(quadrant_type: "individual_ok", overall: "o", content: "We think you can do a better job of working with your partner to stay engaged and connected in your relationship.", recommendation: "In this section of the test we assessed the degree to which you were feeling lonely and disengaged. While not a major issue for you, your answers indicate that you and your partner can do a better job of staying engaged and connected so that you do not feel lonely in this relationship. The goal here is to be able to count on your partner to be there for you when you have a need to connect, and to feel like you are a major priority in their lives. Negotiating this balance of dependence and interdependence can be challenging, but luckily we have developed a solution. In order to do work on this area of your relationship we recommend the following resource which will help you talk openly about what your needs are from one another in terms of interconnectedness:") # You scored ok - you have some problems
ok.products << emotional_loneliness_products[0]

bad = emotional_loneliness.results.create!(quadrant_type: "individual_bad", overall: "b", content: "We think you can do a better job of working with your partner to stay engaged and connected in your relationship.", recommendation: "In this section of the test we assessed the degree to which you were feeling lonely and disengaged. Your answers indicate that you and your partner can do a better job of helping you staying engaged and connected so that you do not feel lonely in this relationship. The goal here is to be able to count on your partner to be there for you when you have a need to connect, and to feel like you are a major priority in their lives. Negotiating this balance of dependence and interdependence can be challenging, but luckily we have developed a solution. In order to do work on this area of your relationship we recommend the following resources which will help you talk openly about what your needs are from one another in terms of interconnectedness:") # You scored bad - you have problems
emotional_loneliness_products.each {|product| bad.products << product}

emotional_loneliness.results.create!(quadrant_type: "couple_good_good", overall: "g", content: "Congratulations, you are both engaged and connected in your relationship and have created a good balance between dependence and interdependence.", recommendation: "From your answers it is clear that both of you feel connected and engaged with one another and neither person is feeling lonely in this relationship. This means that you can both usually count on one another when you have a need to connect. Furthermore you each feel like you are major priority in each others’ lives. Negotiating this balance of dependence and interdependence can be difficult for some couples but you two have nailed it and this is a real strength in your relationship.") # You both scored good - this relationship no problems

bad = emotional_loneliness.results.create!(quadrant_type: "couple_good_bad", overall: "b", content: "Your partner needs your help in order to feel more engaged and connected in the relationship.", recommendation: "In this section of the test we assessed the degree to which you were feeling lonely and disengaged from your partner. Your answers indicate that you feel good, but relationships are a team sport and your partner needs your help in order to feel less lonely. In order to get them to be more connected and engaged to with the relationship, they first need to feel like they can count on you to be there for them when they need to connect. We know how hard it can be with all the stresses and time constraints of daily life to always be there for someone, so we recommend the following resources in order to foster interconnectedness and help your partner feel like they are a major priority in your life:") # You scored good your partner scored bad - your partner needs your help badly!
emotional_loneliness_products.each {|product| bad.products << product}

ok = emotional_loneliness.results.create!(quadrant_type: "couple_good_ok", overall: "o", content: "Your partner needs a little help in order to feel more engaged and connected in the relationship", recommendation: "In this section of the test we assessed the degree to which you were feeling lonely and disengaged from your partner. Your answers indicate that you feel good, and while your partner is almost on your level, they need a little help in order to feel like they are fully connected and engaged. In order to do this we propose that you talk with them and help them understand that they can count on you to be there for them when they need to connect. We know how hard it can be with all the stresses and time constraints of daily life to always be there for someone, so we recommend the following resources in order to foster interconnectedness and help your partner feel like they are a major priority in your life:") # You scored good your partner scored ok - your partner has some issues that they need your help with
ok.products << emotional_loneliness_products[0]

bad = emotional_loneliness.results.create!(quadrant_type: "couple_bad_good", overall: "b", content: "We think you can do a better job of working with your partner to stay engaged and connected in your relationship.", recommendation: "In this section of the test we assessed the degree to which you were feeling lonely and disengaged. Your answers indicate that you and your partner can do a better job of helping you staying engaged and connected so that you do not feel lonely in this relationship. The goal here is to be able to count on your partner to be there for you when you have a need to connect, and to feel like you are a major priority in their lives. Negotiating this balance of dependence and interdependence can be challenging, but luckily we have developed a solution. In order to do work on this area of your relationship we recommend the following resources which will help you talk openly about what your needs are from one another in terms of interconnectedness:") # You scored bad your partner scored good - you have some things you need to work on and you need your partner's help
emotional_loneliness_products.each {|product| bad.products << product}

bad = emotional_loneliness.results.create!(quadrant_type: "couple_bad_bad", overall: "b", content: "We think you can both do a better job of helping each other to stay engaged and connected in your relationship.", recommendation: "In this section of the test we assessed the degree to which you were feeling lonely and disengaged. Your answers indicate that you and your partner can do a better job of staying engaged and connected with one another so that neither of you feel lonely in this relationship. The goal here is to be able to count on one another and be there for each other when you have a need to connect. We want you both to feel like you are a major priority in each others’ lives and we know that negotiating this balance of dependence and interdependence can be challenging. Luckily we have developed a solution from our decades of relationship research. In order to do work on this area of your relationship we strongly recommend the following resources which will help you talk openly about what your needs are from one another in terms of interconnectedness:") # You both scored bad - you both have problems and need to work on this area
emotional_loneliness_products.each {|product| bad.products << product}

bad = emotional_loneliness.results.create!(quadrant_type: "couple_bad_ok", overall: "b", content: "We think you can both do a better job of helping each other to stay engaged and connected in your relationship.", recommendation: "In this section of the test we assessed the degree to which you were feeling lonely and disengaged. Your answers indicate that you and your partner can do a better job of staying engaged and connected with one another so that neither of you feel lonely in this relationship. The goal here is to be able to count on one another and be there for each other when you have a need to connect. We want you both to feel like you are a major priority in each others’ lives and we know that negotiating this balance of dependence and interdependence can be challenging. Luckily we have developed a solution from our decades of relationship research. In order to do work on this area of your relationship we strongly recommend the following resources which will help you talk openly about what your needs are from one another in terms of interconnectedness:") # You scored bad and your partner scored ok - you have some issues you need to work on and so does your partner to a lesser degree
emotional_loneliness_products.each {|product| bad.products << product}

ok = emotional_loneliness.results.create!(quadrant_type: "couple_ok_good", overall: "o", content: "It’s almost there and we want you to work with your partner in order to feel a little more engaged and connected in the relationship.", recommendation: "In this section of the test we assessed the degree to which you were feeling lonely and disengaged. While not a major issue for you, your answers indicate that you and your partner can do a better job of staying engaged and connected so that you do not feel lonely in this relationship. The goal here is to be able to count on your partner to be there for you when you have a need to connect, and to feel like you are a major priority in their lives. Negotiating this balance of dependence and interdependence can be challenging, but luckily we have developed a solution. In order to do work on this area of your relationship we recommend the following resource which will help you talk openly about what your needs are from one another in terms of interconnectedness:") #You scored ok and your partner scored good - you have some minor issues that you need your partner's help with
ok.products << emotional_loneliness_products[0]

bad = emotional_loneliness.results.create!(quadrant_type: "couple_ok_bad", overall: "b", content: "We think you can both do a better job of helping each other to stay engaged and connected in your relationship.", recommendation: "In this section of the test we assessed the degree to which you were feeling lonely and disengaged. Your answers indicate that you and your partner can do a better job of staying engaged and connected with one another so that neither of you feel lonely in this relationship. The goal here is to be able to count on one another and be there for each other when you have a need to connect. We want you both to feel like you are a major priority in each others’ lives and we know that negotiating this balance of dependence and interdependence can be challenging. Luckily we have developed a solution from our decades of relationship research. In order to do work on this area of your relationship we strongly recommend the following resources which will help you talk openly about what your needs are from one another in terms of interconnectedness:") # You scored ok and your partner scored bad - you have some minor issues and your partner has some major ones
emotional_loneliness_products.each {|product| bad.products << product}

ok = emotional_loneliness.results.create!(quadrant_type: "couple_ok_ok", overall: "o", content: "We think you can both do a better job of helping each other to stay engaged and connected in your relationship.", recommendation: "In this section of the test we assessed the degree to which you were feeling lonely and disengaged. While neither of you scored poorly in this area, your answers do indicate that you and your partner can do a better job of staying engaged and connected with one another. The goal here is to be able to count on one another and be there for each other when you have a need to connect. We want you both to feel like you are a major priority in each others’ lives and we know that negotiating this balance of dependence and interdependence can be challenging. Luckily we have developed a solution from our decades of relationship research that can help. If you agree that this is something you would like to work on then we strongly recommend the following resources which will help you talk openly about what your needs are from one another in terms of fostering interconnectedness:") #Both Partners Scored Just Ok - there are some minor issues that need to be addressed
ok.products << emotional_loneliness_products[0]