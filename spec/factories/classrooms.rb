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
FactoryBot.define do
  factory :classroom do
    room_number { rand(1..1000) }
    building { FFaker::Address.building_number }
  end
end
