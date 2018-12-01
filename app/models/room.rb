class Room < ApplicationRecord
  validates_uniqueness_of :room_no
  validates_presence_of :room_no

  has_many :persons, through: :person_room_visits
  has_many :person_room_visits

  def self.get_rooms_details
    details = []
    self.order("room_no").each do |room|
      details.push("#{room.room_no}, #{room.avg_time_spent.to_i} minutes average visit, #{room.total_persons_visited} visitor(s) total")
    end
    details
  end
end
