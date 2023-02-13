# == Schema Information
#
# Table name: polls
#
#  id         :bigint           not null, primary key
#  poller_id  :bigint           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Poll < ApplicationRecord

    belongs_to(
        :author, 
        class_name: :User,
        primary_key: :id,
        foreign_key: :poller_id
    )

    has_many(
        :questions,
        class_name: :Question,
        foreign_key: :poll_id, 
        primary_key: :id, 
        dependent: :destory
    )

end
