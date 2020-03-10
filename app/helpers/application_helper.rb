module ApplicationHelper

  def current_class?(test_path)
    return 'active' if params[:query] == test_path
    ''
  end
end
