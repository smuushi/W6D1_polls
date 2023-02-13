# == Schema Information
#
# Table name: answerchoices
#
#  id          :bigint           not null, primary key
#  question_id :bigint           not null
#  choice      :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Answerchoice < ApplicationRecord
    self.table_name = "answerchoices"

    belongs_to(
        :question, 
        class_name: :Question, 
        primary_key: :id,
        foreign_key: :question_id
    )

    has_many(
        :responses, 
        class_name: :responses, 
        primary_key: :id, 
        foreign_key: :response_choice_id
    )
end
