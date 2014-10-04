###Questionnaire 4 TURNING TOWARDS###
module TurningTowards

  #Questionnaire#

  turning_towards = Questionnaire.create!(title: "Turning Towards", cutoff_score: 4, ok_score: 5, weight: 0.2) #cutoff_score < 4 and it's a bad thing

  #Grouping#

  Grouping.find(3).questionnaires << turning_towards

  #Questions#

  turning_towards.questions.create! content: "I really enjoy discussing things with my partner"
  turning_towards.questions.create! content: "We always have a lot to say to each other"
  turning_towards.questions.create! content: "We have a lot of fun together in our everyday lives"
  turning_towards.questions.create! content: "We reall have a lot of interests in common"
  turning_towards.questions.create! content: "We like to do a lot of the same things"

  #PossibleResponses#
  true_false_normal = []
  (6..7).to_a.each {|num| true_false_normal << PossibleResponse.find(num)}
  
  turning_towards.questions.each do |question|
    true_false_normal.each do |response|
      question.possible_responses << response
    end
  end

  #Products#

  turning_towards_products = []

  turning_towards_products << Product.create!(name: "Stress Reducing Conversation", description: "An excellent opportunity to connect and turn towards your partner is to talk with them and give them support with the daily stresses which they face. The purpose of this process is to assist you in the management of daily external stress—stress that comes from outside the relationship, such as job stressors.Research has shown that the couples who buffered their relationship from external stresses were able to maintain their positive changes over time.")
  turning_towards_products << Product.create!(name: "Personalized Therapy Help", description: "A therapist! The very name makes you want cringe and reaffirm that your relationship is actually pretty good and that while maybe other couples might need professional help, you do not. Wrong. It's completely normal for couples in committed relationships to have issues that they need to work on. A therapist is like a doctor for your relationship and it's time for your yearly physical. Find one now:")

  #Results#

  turning_towards.results.create!(quadrant_type: "individual_good", overall: "good", content: "Congratulations, you have built and maintained a sensitive and robust friendship with your partner!", recommendation: "It’s clear that your partner notices and respond positively to your bids for attention, your desires to talk seriously, and your needs to joke, play, and have fun. Furthermore, its likely that you often believe that your partners’ interest and enthusiasm matches your own. This is good because it also means that your partner likely  responds your attempts at humor in a positive way. This is a real strength in your friendship.")#You scored good - you have no problems in this area

  ok = turning_towards.results.create!(quadrant_type: "individual_ok", overall: "ok", content: "We think you and your partner can do a better job of noticing and responding to each others emotional and intellectual needs", recommendation: "Based on your score it’s possible that your partner doesn’t always notice and respond to your needs and bids for connection while you do notice and respond to theirs. For example, your partner sometimes doesn’t notice when you want to get their attention, or when you need to talk, joke, play, or just have fun. It may also be the case that their interests and enthusiasm don’t always match yours and that they don’t respond to your attempts to be funny. This asymmetry in your relationship while relatively minor right now could, if left unchecked, lead to larger problems down the road such as neither of you feeling attended to nor safe enough to confide in the other. In order to talk to your partner in a constructive way about getting them to respond to your emotion bids, we strongly suggest the following resource:") # You scored ok - you have some problems
  ok.products << turning_towards_products[0]

  bad = turning_towards.results.create!(quadrant_type: "individual_bad", overall: "bad", content: "We think you and your partner can do a better job of noticing and responding to each others emotional and intellectual needs", recommendation: "Based on your score it’s clear that your partner doesn’t always notice and respond to your needs and bids for connection while you feel like do notice and respond to theirs. For example, your partner sometimes doesn’t notice when you want to get their attention, or when you need to talk, joke, play, or just have fun. It may also be the case that their interests and enthusiasm don’t always match yours and that they don’t respond to your attempts to be funny. This asymmetry in your relationship could, if left unchecked, lead to deeper issues such as neither of you feeling attended to nor safe enough to confide in the other. In order to talk to your partner in a constructive way about getting them to respond to your emotion bids, we strongly suggest the following resources:") # You scored bad - you have problems
  turning_towards_products.each {|product| bad.products << product}

  turning_towards.results.create!(quadrant_type: "couple_good_good", overall: "good", content: "Congratulations, you have built and maintained a sensitive and robust friendship with one another!", recommendation: "It’s clear that both of you turn towards one another’s bids for attention and most often respond to each other’s needs for confiding, having fun together, and laughing together. Furthermore, both of you often believe that your partners’ interests and enthusiasm match your own. This is good because it also means that you respond to each others attempts at humor in a positive way. This is a real strength in your friendship.") # You both scored good - this relationship no problems

  bad = turning_towards.results.create!(quadrant_type: "couple_good_bad", overall: "bad", content: "Your partner needs your help in building a relationship where you both notice and respond to each others emotional and intellectual needs", recommendation: "While you feel like you do a good job of noticing and responding to your partners’ needs and bids for connection, your partner may feel like you don’t always notice and respond to theirs needs. For example, they may feel that you sometimes don’t notice when they want attention, or when they need to talk, joke, play, or just have fun. It may also be the case that their interests and enthusiasm don’t always match yours. The act of ‘Turning Towards’ and responding to your partner when they make bids for connection helps build a good foundation of friendship in the relationship. What this really means is talking with your partner so that you can both state your needs for connection, and then working to notice and respond to bids for connection when they are made. To help you and your partner feel more connected in the small moments of every day we strongly suggest the following resource:") # You scored good your partner scored bad - your partner needs your help badly!
  turning_towards_products.each {|product| bad.products << product}

  ok = turning_towards.results.create!(quadrant_type: "couple_good_ok", overall: "ok", content: "Your partner needs your help in building a relationship where you both notice and respond to each others emotional and intellectual needs", recommendation: "While you feel like you do a good job of noticing and responding to your partners’ needs and bids for connection, your partner might feel like you can do a little better job. For example, they may feel that on occasion, you don’t notice when they want attention, or when they need to talk, joke, play, or just have fun. It may also be the case that sometimes their interests and enthusiasm don’t match yours. Since this asymmetry is minor it’s really not a big problem for you two right now. If left unchecked however this could lead to deeper issues such as neither of you feeling attended to nor safe enough to confide in one another. The act of ‘Turning Towards’ and responding to your partner when they make bids for connection helps build a good foundation of friendship in the relationship. What this really means is talking with your partner so that you can both state your needs for connection, and then working to notice and respond to bids for connection when they are made. To help you and your partner feel more connected in the small moments of every day we strongly suggest the following resource:") # You scored good your partner scored ok - your partner has some issues that they need your help with
  ok.products << turning_towards_products[0]

  bad = turning_towards.results.create!(quadrant_type: "couple_bad_good", overall: "bad", content: "We think you and your partner can do a better job of noticing and responding to each others emotional and intellectual needs", recommendation: "Based on your score it’s clear that your partner doesn’t always notice and respond to your needs and bids for connection while you feel like do notice and respond to theirs. For example, your partner sometimes doesn’t notice when you want to get their attention, or when you need to talk, joke, play, or just have fun. It may also be the case that their interests and enthusiasm don’t always match yours and that they don’t respond to your attempts to be funny. This asymmetry in your relationship could, if left unchecked, lead to deeper issues such as neither of you feeling attended to nor safe enough to confide in the other. In order to talk to your partner in a constructive way about getting them to respond to your emotion bids, we strongly suggest the following resources:") # You scored bad your partner scored good - you have some things you need to work on and you need your partner's help
  turning_towards_products.each {|product| bad.products << product}

  bad = turning_towards.results.create!(quadrant_type: "couple_bad_bad", overall: "bad", content: "We think you and your partner can do a better job of noticing and responding to each others emotional and intellectual needs", recommendation: "Your responses indicate that neither of you feel like your needs are being noticed and responded to by the other, but that is ok. Since you now know this we can start to improve this area of your relationship -- think of this as an opportunity to work on your friendship together as a team. The reason you both feel this way could be because you are each making bids for connection with your partner, but your partner seems oblivious to them. Or due to past failures to connect, you may have stopped making bids for connection altogether. If left unchecked this can lead to serious problems in your relationship such as neither of you feeling attended to nor safe enough to confide in the other. The good news is that we have already assisted tens of thousands of couples in improving this area of their relationship, and by using the following resources we can help you as well:") # You both scored bad - you both have problems and need to work on this area
  turning_towards_products.each {|product| bad.products << product}

  bad = turning_towards.results.create!(quadrant_type: "couple_bad_ok", overall: "bad", content: "We think you and your partner can do a better job of noticing and responding to each others emotional and intellectual needs", recommendation: "Your responses indicate that neither of you feel like your needs are being noticed and responded to by the other, but that is ok. Since you now know this we can start to improve this area of your relationship -- think of this as an opportunity to work on your friendship together as a team. The reason you both feel this way could be because you are each making bids for connection with your partner, but your partner seems oblivious to them. Or due to past failures to connect, you may have stopped making bids for connection altogether. If left unchecked this can lead to serious problems in your relationship such as neither of you feeling attended to nor safe enough to confide in the other. The good news is that we have already assisted tens of thousands of couples in improving this area of their relationship, and by using the following resources we can help you as well:") # You scored bad and your partner scored ok - you have some issues you need to work on and so does your partner to a lesser degree
  turning_towards_products.each {|product| bad.products << product}

  ok = turning_towards.results.create!(quadrant_type: "couple_ok_good", overall: "ok", content: "It’s almost there but we want you and your partner to work to build a relationship where you both notice and respond to each others emotional and intellectual needs", recommendation: "Based on your score it’s possible that your partner doesn’t always notice and respond to your needs and bids for connection while you do notice and respond to theirs. For example, your partner sometimes doesn’t notice when you want to get their attention, or when you need to talk, joke, play, or just have fun. It may also be the case that their interests and enthusiasm don’t always match yours and that they don’t respond to your attempts to be funny. This asymmetry in your relationship while relatively minor right now could, if left unchecked, lead to larger problems down the road such as neither of you feeling attended to nor safe enough to confide in the other. In order to talk to your partner in a constructive way about getting them to respond to your emotion bids, we strongly suggest the following resource:") #You scored ok and your partner scored good - you have some minor issues that you need your partner's help with
  ok.products << turning_towards_products[0]

  bad = turning_towards.results.create!(quadrant_type: "couple_ok_bad", overall: "bad", content: "We think you and your partner can do a better job of noticing and responding to each others emotional and intellectual needs", recommendation: "Your responses indicate that neither of you feel like your needs are being noticed and responded to by the other, but that is ok. Since you now know this we can start to improve this area of your relationship -- think of this as an opportunity to work on your friendship together as a team. The reason you both feel this way could be because you are each making bids for connection with your partner, but your partner seems oblivious to them. Or due to past failures to connect, you may have stopped making bids for connection altogether. If left unchecked this can lead to serious problems in your relationship such as neither of you feeling attended to nor safe enough to confide in the other. The good news is that we have already assisted tens of thousands of couples in improving this area of their relationship, and by using the following resources we can help you as well:") # You scored ok and your partner scored bad - you have some minor issues and your partner has some major ones
  turning_towards_products.each {|product| bad.products << product}

  ok = turning_towards.results.create!(quadrant_type: "couple_ok_ok", overall: "ok", content: "We think you and your partner can do a better job of noticing and responding to each others emotional and intellectual needs", recommendation: "While not a major issue your responses indicate that on occasion both of you feel like your needs are not being noticed and responded to by the other. If left unchecked this can lead to serious problems in your relationship such as neither of you feeling attended to nor safe enough to confide in the other. If this is how you feel, the reason you both feel this way could be because you are each making bids for connection with your partner, but your partner seems oblivious to them. Or due to past failures to connect, you may have stopped making bids for connection as much as you used to. The good news is that you have the chance to fix any real problems before they manifest themselves in major ways. To do so we recommend the following resources:") #Both Partners Scored Just Ok - there are some minor issues that need to be addressed
  ok.products << turning_towards_products[0]
end