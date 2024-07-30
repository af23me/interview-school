# frozen_string_literal: true

ActiveAdmin.register Section do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :teacher_subject_id, :classroom_id, :weekdays, :section_start_at, :section_end_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:teacher_subject_id, :classroom_id, :weekdays, :section_start_at, :section_end_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
