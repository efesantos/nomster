class Place < ActiveRecord::Base

  paginates_per 5 #Defined in Kaminati gem

  belongs_to :user
  has_many :comments

  validates :name, :address, :description, presence: true
  validates :name, length: {minimum: 4}

  geocoded_by :address
  after_validation :geocode

end
