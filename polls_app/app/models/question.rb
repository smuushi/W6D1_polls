# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  question   :text             not null
#  poll_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord

    belongs_to(
        :poll, 
        class_name: :Poll, 
        foreign_key: :poll_id, 
        primary_key: :id
    )

    has_many(
        :answer_choices
        class_name: :Answerchoice,
        foreign_key: :question_id, 
        primary_key: :id,
        dependent: :destroy
    )

end
