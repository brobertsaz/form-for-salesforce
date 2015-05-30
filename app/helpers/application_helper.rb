module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | TestingForm"
    end
  end
end
