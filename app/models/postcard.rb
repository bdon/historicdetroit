# == Schema Information
#
# Table name: postcards
#
#  id          :integer          not null, primary key
#  title       :string
#  caption     :text
#  byline      :string
#  subject     :string
#  building_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#  front       :string
#  back        :string
#

class Postcard < ApplicationRecord
  mount_uploader :front, ImageUploader
  mount_uploader :back, ImageUploader

  include ImageHelper

  has_and_belongs_to_many :buildings, join_table: :buildings_postcards
  has_and_belongs_to_many :subjects, join_table: :postcards_subjects

  default_scope { order(title: :asc) }

  def photo
    return front if front
    back
  end

  def front_full
    front.full.url
  end

  def front_mobile
    front.mobile.url
  end

  def back_full
    back.full.url
  end

  def back_mobile
    back.mobile.url
  end
end
