class Admin::Course < ApplicationRecord
  has_attached_file :image, styles: { large:'600x600>',medium: '300x300>', thumb: '100x100>' }, default_url: '/assets/rails.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :description
  has_many :admin_subjects, :class_name => 'Admin::Subject',:inverse_of=>"admin_subjects"
end
