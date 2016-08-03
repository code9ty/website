html = "<%= escape_javascript( render 'projects/bid', bid: @bid ) %>"
$('#bids').prepend(html)
$("#project_<%= @bid.project_id%>").hide()
