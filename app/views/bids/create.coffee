html = "<%= escape_javascript( render 'projects/bid', bid: @bid ) %>"
$('.bids').append(html)
$("#<%= @bid.project_id%>").hide()
