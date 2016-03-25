class Event < ActiveRecord::Base
  has_many :comments
  belongs_to :cat
  belongs_to :user
end
