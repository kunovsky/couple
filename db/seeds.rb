###SURVEY 1 OVERALL HAPPINESS###

overall_happiness = Survey.create! title: "Overall Happiness", cutoff_score: 55

overall_happiness.questions.create! content: "I feel emotionally close to my partner."
overall_happiness.questions.create! content: "I think that my partner really cares about me."
overall_happiness.questions.create! content: "I feel confident that we can deal with whatever problems might arise."
overall_happiness.questions.create! content: "I would consider myself happy in this relationship."
overall_happiness.questions.create! content: "My partner really listens to me."
overall_happiness.questions.create! content: "I feel that my partner finds me physically attractive."
overall_happiness.questions.create! content: "I can talk to my partner about anything."
overall_happiness.questions.create! content: "I feel that my partner is very interested in me."
overall_happiness.questions.create! content: "I feel respected by my partner."
overall_happiness.questions.create! content: "I am committed to staying together."
overall_happiness.questions.create! content: "I have a great deal of respect and admiration for my partner."
overall_happiness.questions.create! content: "My partner really tries hard to meet my needs."
overall_happiness.questions.create! content: "My partner respects my dreams in life."
overall_happiness.questions.create! content: "My partner is one of my best friends."
overall_happiness.questions.create! content: "My partner rarely puts me down."

overall_happiness.questions.each do |question|
  question.possible_responses.create! content: "Strongly Disagree", point_value: 1
  question.possible_responses.create! content: "Disagree", point_value: 2
  question.possible_responses.create! content: "Neutral", point_value: 3
  question.possible_responses.create! content: "Agree", point_value: 4
  question.possible_responses.create! content: "Strongly Agree", point_value: 5
end