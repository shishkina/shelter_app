class Comment < ActiveRecord::Base
  belongs_to :animal
  belongs_to :user
end
