module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Flowv1"
    end
  end
end
