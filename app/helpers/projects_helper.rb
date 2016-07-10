module ProjectsHelper
  def max_days project
    project.due_date - project.start_date
  end

  def remaining_days project
    if project.due_date.future?
      # project.due_date - Time.zone.now
      distance_of_time_in_words(Time.zone.now, project.due_date)
    else
      0
    end
  end

  def percentage_remaining project
    if project.due_date.future?
       percentage = ((project.due_date - Time.zone.now)/max_days(project))*100
       if percentage.to_i >=  0
         percentage.to_i
       else
         0
       end
    else
      0
    end
  end

  def coloring project
    if project.due_date.future?
      percentage = percentage_remaining project
      if percentage < 33
        "alert"
      elsif percentage < 66
        "warning"
      else
        "success"
      end
    end
  end
end
