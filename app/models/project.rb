class Project < ActiveRecord::Base

	extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]

	has_many :tasks

	validates :name, presence: true, length: {maximum: 25}
	validates :content, presence: true, length: {maximum: 500}
	validates :price, presence: true, numericality: { only_integer: true }

	has_attached_file :image, styles: { medium: "680x300>", thumb: "175x75>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def shortname
		name.length > 15? name[0..15] + "..." : name
	end

end