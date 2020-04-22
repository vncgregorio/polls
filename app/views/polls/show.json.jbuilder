json.set! :poll_id, @poll.id
json.set! :poll_description, @poll.description
json.options @poll.options do |option|
  json.set! :option_id, option.number
  json.set! :option_description, option.description
end
