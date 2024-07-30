# frozen_string_literal: true

ActiveAdmin.register Classroom do
  permit_params :room_number, :building
end
