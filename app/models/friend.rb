class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  include PgSearch::Model
  pg_search_scope :search_by_email,
    against: [ :email ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
