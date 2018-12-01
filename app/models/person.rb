class Person < ApplicationRecord
  validates_uniqueness_of :person_no
  validates_presence_of :person_no

  has_many :rooms, through: :person_room_visits
  has_many :person_room_visits
end
