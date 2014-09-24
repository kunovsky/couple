### Questionnaire 2 LOVEMAPS###
module LoveMaps

  #Questionnaire#

  love_maps = Questionnaire.create!(title: "Love Maps", cutoff_score: 12, ok_score: 14, weight: 0.2) #cutoff_score < 12 and it's a bad thing

  #Grouping#
  
  love_maps_grouping = Grouping.create!(name: "Love Maps")
  love_maps_grouping.questionnaires << love_maps

  #Questions#

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

  #PossibleResponses#

  true_false_normal = []
  (6..7).to_a.each {|num| true_false_normal << PossibleResponse.find(num)}

  love_maps.questions.each do |question|
    true_false_normal.each do |response|
      question.possible_responses << response
    end
  end

  #Products#

  love_maps_products = []

  love_maps_products << Product.create!(name: "Love Maps App", description: "Research shows that a powerful predictor of relationship stability is whether couples allocate 'mental room' for their partner's world. This means having a mental map of the relationship and its history, and knowing each partner's past and present concerns, preferences, experiences and reality. Make your 'map' with this app -it brings you closer by helping you to get to know each other in ways you may not have realized were important. The Love Map and Open-Ended Question App enable you both to connect emotionally, and increase intimacy and understanding in a fun, gentle way.")
  love_maps_products << Product.create!(name: "Talk with a therapist about improving your friendship", description: "So what I don't know what my partner had for breakfast yesterday morning BIG DEAL. While not knowing the answer to several of these questions might seem trivial to you, it's actually indicative of larger problems in the relationship overall, such as poor friendship. Not knowing the answers to questions like these could eventually lead to both of you feeling inadequately known and feeling like neither person is interested in continuing to know the other. We want to make sure that both of you have a deeper awareness of each other's hopes and aspirations and a solid understanding of one another is central to this. Talk with a therapist and you will thank us later.")

  #Results#
  
  love_maps.results.create!(quadrant_type: "individual_good", overall: "g", content: "Congratulations, you have an excellent understanding of your partner and their internal world!", recommendation: "We call the idea of knowing your partner 'Love Mapping' and it's an important part of having close friendship and a good relationship overall. Love Mapping is more than simply knowing their favorite food or type of movie – it's a continual download of your partner's inner world into your brain.  Knowing what their stressors are, their current worries, their major fears (and continuously updating that knowledge). And it is important to having both good friendship and a good relationship overall. Make sure to constantly update your love maps by asking your partner open ended questions about their life.") # you scored good - no problems

  ok = love_maps.results.create!(quadrant_type: "individual_ok", overall: "o", content: "You know your partner's life and inner world pretty well, but you think you can do better.", recommendation: "We call the idea of knowing your partner 'Love Mapping' and it's an important part of having close friendship and a good relationship overall. Love Mapping is more than simply knowing their favorite food or type of movie – it's a continuous download of your partner's inner world into your brain. Knowing the relevant information about your partner, such as their worries, hopes, and goals in life; their history; and the facts and feelings that constitute their being is extremely important. Happy couples use their love maps to express not only their understanding of each other, but their fondness and admiration as well. In an effort to better understand your partner, we strongly suggest the following resources:")# you scored ok -- you need to learn your partner's love maps better
  ok.products << love_maps_products[0]

  bad = love_maps.results.create!(quadrant_type: "individual_bad", overall: "b", content: "We think you can do a better job of learning about your partner's life and their inner world.", recommendation: "We call the idea of knowing your partner 'Love Mapping' and it's an important part of having close friendship and a good relationship overall. Love Mapping is more than simply knowing their favorite food or type of movie – it's a continuous download of your partner's inner world into your brain. Knowing the relevant information about your partner, such as their worries, hopes, and goals in life; their history; and the facts and feelings that constitute their being is extremely important. Happy couples use their love maps to express not only their understanding of each other, but their fondness and admiration as well. Not knowing the answers to several of the questions we asked you about your partner's life shows us that you have some catching up to do in terms of understanding their inner world. We strongly suggest the following resources:") # you scored bad -- you have problems
  love_maps_products.each {|product| bad.products << product}

  love_maps.results.create!(quadrant_type: "couple_good_good", overall: "g", content: "Congratulations, you both have an excellent understanding of each others lives and internal worlds!", recommendation: "We call the idea of knowing your partner 'Love Mapping' and it's an important part of having close friendship and a good relationship overall. The good news is you both scored well and have allocated lots of cognitive room for each other! Love Mapping is more than simply knowing their favorite food or type of movie – it's a continuous download of your partner's inner world into your brain. Knowing the relevant information about your partner, such as their worries, hopes, and goals in life; their history; and the facts and feelings that constitute their being is extremely important. Happy couples use their love maps to express not only their understanding of each other, but their fondness and admiration as well. Make sure to keep this knowledge updated by asking each other open ended questions.") #You both scored good - this relationship no problems

  bad = love_maps.results.create!(quadrant_type: "couple_good_bad", overall: "b", content: "Your partner needs your help to better understand your life and internal world.", recommendation: "We call the idea of knowing your partner 'Love Mapping' and it's an important part of having close friendship and a good relationship overall. Love Mapping is more than simply knowing their favorite food or type of movie – it's a continuous download of your partner's inner world into your brain. Knowing the relevant information about your partner, such as their worries, hopes, and goals in life; their history; and the facts and feelings that constitute their being is extremely important. Happy couples use their love maps to express not only their understanding of each other, but their fondness and admiration as well. That said, while you have a good grasp on the life of and internal world of your partner, they need your help to better understand this information about you. Think of this an opportunity for emotional connection with them. To help you do this in a constructive way we strongly suggest the following resources as a means of having this conversation:") #You scored good your partner scored bad - your partner needs your help badly!
  love_maps_products.each {|product| bad.products << product}

  ok = love_maps.results.create!(quadrant_type: "couple_good_ok", overall: "o", content: "We think you can help your partner do a better job of understanding your life and internal world.", recommendation: "We call the idea of knowing your partner 'Love Mapping' and it's an important part of having close friendship and a good relationship overall. Love Mapping is more than simply knowing their favorite food or type of movie – it's a continuous download of your partner's inner world into your brain. Knowing the relevant information about your partner, such as their worries, hopes, and goals in life; their history; and the facts and feelings that constitute their being is extremely important. Happy couples use their love maps to express not only their understanding of each other, but their fondness and admiration as well. That said, while you have a good grasp on the life of and internal world of your partner, they need a little help to better understand this information about you.  Think of this an opportunity for emotional connection with them. To help you do this in a constructive way we suggest the following resources as a means of having this conversation:") #You scored good your partner scored ok - your partner has some issues that they need your help with
  ok.products << love_maps_products[0]

  bad = love_maps.results.create!(quadrant_type: "couple_bad_good", overall: "b", content: "We think you can do a better job of learning about your partner's life and their inner world.", recommendation: "We call the idea of knowing your partner 'Love Mapping' and it's an important part of having close friendship and a good relationship overall. Love Mapping is more than simply knowing their favorite food or type of movie – it's a continuous download of your partner's inner world into your brain. Knowing the relevant information about your partner, such as their worries, hopes, and goals in life; their history; and the facts and feelings that constitute their being is extremely important. Happy couples use their love maps to express not only their understanding of each other, but their fondness and admiration as well. Not knowing the answers to several of the questions we asked you about your partner's life shows us that you have some catching up to do in terms of understanding their inner world.  Think of this an opportunity for emotional connection with them. To help you both do this in a constructive way we strongly suggest the following resources as a means of having this conversation:") #You scored bad your partner scored good - you have some things you need to work on and you need your partner's help
  love_maps_products.each {|product| bad.products << product}

  bad = love_maps.results.create!(quadrant_type: "couple_bad_bad", overall: "b", content: "We want both of you to do a better job of understanding each other's lives and inner worlds", recommendation: "We call the idea of knowing your partner 'Love Mapping' and it's an important part of having close friendship and a good relationship overall. Love Mapping is more than simply knowing their favorite food or type of movie – it's a continuous download of your partner's inner world into your brain. Knowing the relevant information about your partner, such as their worries, hopes, and goals in life; their history; and the facts and feelings that constitute their being is extremely important. Happy couples use their love maps to express not only their understanding of each other, but their fondness and admiration as well. Your scores indicate that both you and your partner have some catching up to do in this area in order to stay connected emotionally. To help you both do this in a constructive way we strongly suggest the following resources as a means of having this conversation:") #You both scored bad - you both have problems and need to work on this area
  love_maps_products.each {|product| bad.products << product}

  bad = love_maps.results.create!(quadrant_type: "couple_bad_ok", overall: "b", content: "We want both of you to do a better job of understanding each other's lives and inner worlds", recommendation: "We want both of you to do a better job of understanding each other's lives and inner worlds", recommendation: "We call the idea of knowing your partner 'Love Mapping' and it's an important part of having close friendship and a good relationship overall. Love Mapping is more than simply knowing their favorite food or type of movie – it's a continuous download of your partner's inner world into your brain. Knowing the relevant information about your partner, such as their worries, hopes, and goals in life; their history; and the facts and feelings that constitute their being is extremely important. Happy couples use their love maps to express not only their understanding of each other, but their fondness and admiration as well. Your scores indicate that both you and your partner have some catching up to do in this area in order to stay connected emotionally. To help you both do this in a constructive way we strongly suggest the following resources as a means of having this conversation:") #You scored bad and your partner scored ok - you have some issues you need to work on and so does your partner to a lesser degree
  love_maps_products.each {|product| bad.products << product}

  ok = love_maps.results.create!(quadrant_type: "couple_ok_good", overall: "o", content: "You know your partner's life and inner world pretty well, but you think you can do better.", recommendation: "We call the idea of knowing your partner 'Love Mapping' and it's an important part of having close friendship and a good relationship overall. Love Mapping is more than simply knowing their favorite food or type of movie – it's a continuous download of your partner's inner world into your brain. Knowing the relevant information about your partner, such as their worries, hopes, and goals in life; their history; and the facts and feelings that constitute their being is extremely important. Happy couples use their love maps to express not only their understanding of each other, but their fondness and admiration as well. In an effort to better understand your partner, we strongly suggest the following resources:") #You scored ok and your partner scored good - you have some minor issues that you need your partner's help with
  ok.products << love_maps_products[0]

  bad = love_maps.results.create!(quadrant_type: "couple_ok_bad", overall: "b", content: "We want both of you to do a better job of understanding each other's lives and inner worlds.", recommendation: "We want both of you to do a better job of understanding each other's lives and inner worlds", recommendation: "We call the idea of knowing your partner 'Love Mapping' and it's an important part of having close friendship and a good relationship overall. Love Mapping is more than simply knowing their favorite food or type of movie – it's a continuous download of your partner's inner world into your brain. Knowing the relevant information about your partner, such as their worries, hopes, and goals in life; their history; and the facts and feelings that constitute their being is extremely important. Happy couples use their love maps to express not only their understanding of each other, but their fondness and admiration as well. Your scores indicate that both you and your partner have some catching up to do in this area in order to stay connected emotionally. To help you both do this in a constructive way we strongly suggest the following resources as a means of having this conversation:") # You scored ok and your partner scored bad - you have some minor issues and your partner has some major ones
  love_maps_products.each {|product| bad.products << product}

  ok = love_maps.results.create!(quadrant_type: "couple_ok_ok", overall: "o", content: "We want both of you to do a better job of understanding each other's lives and inner worlds.", recommendation: "We want both of you to do a better job of understanding each other's lives and inner worlds", recommendation: "We call the idea of knowing your partner 'Love Mapping' and it's an important part of having close friendship and a good relationship overall. Love Mapping is more than simply knowing their favorite food or type of movie – it's a continuous download of your partner's inner world into your brain. Knowing the relevant information about your partner, such as their worries, hopes, and goals in life; their history; and the facts and feelings that constitute their being is extremely important. Happy couples use their love maps to express not only their understanding of each other, but their fondness and admiration as well. While your scores weren't bad, they do indicate that both you and your partner have some catching up to do in this area in order to stay connected emotionally. To help you both do this in a constructive way we strongly suggest the following resource as a means of having this conversation:") # You both scored just ok - there are some minor issues that need to be addressed for both of you
  ok.products << love_maps_products[0]
end