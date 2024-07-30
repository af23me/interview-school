# frozen_string_literal: true

module Students
  class BaseController < ::ApplicationController
    before_action :current_student
    layout 'student'

    def current_student
      @current_student ||= Student.last || Student.create!(first_name: 'Test first', last_name: 'Test last')
    end
  end
end
