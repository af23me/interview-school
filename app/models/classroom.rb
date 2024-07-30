# frozen_string_literal: true

# == Schema Information
#
# Table name: classrooms
#
#  id          :bigint           not null, primary key
#  room_number :string           not null
#  building    :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Classroom < ApplicationRecord
  has_many :sections, dependent: :destroy

  validates :room_number, :building, presence: true
  validates :room_number, uniqueness: { scope: :building }
end
