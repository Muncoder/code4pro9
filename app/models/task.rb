class Task < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :project

  validates :title, presence: true, length: {maximum: 25}
  validates :note, presence: true, length: {maximum: 500}
  validates :tag, presence: true, length: {maximum: 25}

  def next
  	project.tasks.where("tag > ? AND header = ?", tag, false).order(:tag).first
  end

  def prev
  	project.tasks.where("tag < ? AND header = ?", tag, false).order(:tag).last
  end

end