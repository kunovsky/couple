module ActiveRecordExtension
  extend ActiveSupport::Concern
  included do
    include ArelHelpers::ArelTable
  end
end

ActiveRecord::Base.send(:include, ActiveRecordExtension)