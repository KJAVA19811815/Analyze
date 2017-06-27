class Question < ActiveRecord::Base
  has_many :choices
  belongs_to :form
  has_many :answers, through: :choices

  YOUNG = (18..22)
  MIDDLE = (23..25)
  OLD = (26..30)
  AGE_FILTERS = [YOUNG, MIDDLE, OLD]

  MALE = 'male'
  FEMALE = 'female'
  GENDER_FILTERS = [MALE, FEMALE]


end

# Question::YOUNG
# Question.const_get('YOUNG')
