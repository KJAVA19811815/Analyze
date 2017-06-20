class Question < ActiveRecord::Base
  has_many :choices
  belongs_to :form
  has_many :answers, through: :choices
end
