
###Last Questionnaire OVERALL SCORE### Note this is not an actual questionnaire, it is just a means of determining overall results by aggregating all other results together

overall_state = Questionnaire.create!(title: "Overall Relationship Score", cutoff_score: 90, ok_score: 80)

overall_state_products = []

overall_state_products << Product.create!(name: "The Art And Science Of Love", description: "This product is designed to help your relationship overall")
overall_state_products << Product.create!(name: "Find a therapist by you", description: "Personalized therapy to help you with your relationship overall")

overall_state.results.create!(quadrant_type: "individual_good", overall: "g", content: "Congratulations, your relationship overall is happy and healthy!", recommendation: "")#You scored good - you have no problems in this area

ok = overall_state.results.create!(quadrant_type: "individual_ok", overall: "o", content: "It’s almost there but your relationship overall could use a boost to make it even better.", recommendation: "") # You scored ok - you have some problems
ok.products << overall_state_products[0]

bad = overall_state.results.create!(quadrant_type: "individual_bad", overall: "b", content: "", recommendation: "") # You scored bad - you have problems
overall_state_products.each {|product| bad.products << product}

overall_state.results.create!(quadrant_type: "couple_good_good", overall: "g", content: "Congratulations, both of you agree that your relationship overall is happy and healthy!", recommendation: "") # You both scored good - this relationship no problems

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
