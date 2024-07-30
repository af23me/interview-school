# frozen_string_literal: true

module Students
  class SectionsController < BaseController
    def index
      @sections = current_student.sections.all
    end

    def download
      respond_to do |format|
        format.pdf do
          render pdf: 'sections',
                 encoding: 'utf8'
        end
      end
    end

    def new
      @sections = Section.order(start_at: :asc).all
    end

    def create
      @section_form = Students::SectionForm.new(current_student.student_sections.new, section_params)
      if @section_form.save
        flash[:success] = 'Sucessfulyy joined section'
        redirect_to students_sections_path
      else
        flash[:error] = @section_form.errors.full_messages.join(', ')
        redirect_to new_students_section_path
      end
    end

    def destroy
      section = current_student.student_sections.find(params[:id])
      section.destroy
      redirect_to student_sections_path, notice: 'Successfully left section'
    end

    private

    def section_params
      params.require(:student_section).permit(:section_id)
    end
  end
end
