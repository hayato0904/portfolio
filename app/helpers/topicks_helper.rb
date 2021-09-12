module TopicksHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_topicks_path
    elsif action_name == 'edit'
      topick_path
    end
  end
end
