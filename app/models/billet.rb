class Billet < ApplicationRecord
    validates :remote_id, presence: true
end
