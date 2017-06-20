class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :answers
  #belongs_to :form, through: :question
end
