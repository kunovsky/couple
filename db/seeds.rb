#TODO: only include therapy for bad_x results. For all other problem variations just include the gottman product?

#TODO:refactor this http://stackoverflow.com/questions/735073/best-way-to-require-all-files-from-a-directory-in-ruby
require File.expand_path('../seeds/possible_response_choices', __FILE__)
require File.expand_path('../seeds/groupings/first/general_happiness', __FILE__)
require File.expand_path('../seeds/groupings/second/love_maps', __FILE__)
require File.expand_path('../seeds/groupings/third/fondness_and_admiration', __FILE__)
require File.expand_path('../seeds/groupings/third/turning_towards', __FILE__)
require File.expand_path('../seeds/groupings/third/emotional_disengagement', __FILE__)
require File.expand_path('../seeds/groupings/overall/overall', __FILE__)