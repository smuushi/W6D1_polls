# == Schema Information
#
# Table name: responses
#
#  id                 :bigint           not null, primary key
#  responder_id       :bigint           not null
#  response_choice_id :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Response < ApplicationRecord

    belongs_to(
        :respondent,
        class_name: :User,
        foreign_key: :responder_id, 
        primary_key: :id
    )

    belongs_to(
        :answer_choice, 
        class_name: :Answerchoice, 
        foreign_key: :response_choice_id,
        primary_key: :id
    )


end
