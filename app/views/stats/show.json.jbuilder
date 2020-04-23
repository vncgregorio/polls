json.set! :views, @poll.views.count
json.votes @poll.options do |option|
  json.set! :option_id, option.number
  json.set! :qty, option.votes.count
end
