class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :gym_id, :client_id, :charge, presence: true
  validates :client_id, uniqueness: {scope: :gym_id,
  message: "You can only have one membership to this gym"}

end
