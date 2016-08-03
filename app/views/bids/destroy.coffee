html = "<%= escape_javascript( render 'projects/project', project: @bid.project ) %>"
$("#bid_<%= @bid.id %>").hide()
$("#projects").prepend(html)
