module ProjectsHelper
  def max_days project
    project.due_date - project.start_date
  end

  def remaining_days project
    project.due_date - Time.zone.now
  end

  def percentage_remaining project
   percentage = (remaining_days(project)/max_days(project))*100
   percentage.to_i
  end

  def coloring project
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
