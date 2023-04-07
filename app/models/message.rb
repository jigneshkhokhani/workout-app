class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  # after_create_commit -> { broadcast_append_to room }
  # after_create_commit { broadcast_replace_to(user, :message, target: "message", partial: "shared/message", locals: { message: self }) }
end
