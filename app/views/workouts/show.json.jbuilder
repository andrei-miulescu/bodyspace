json.set! :workout do
  json.extract! @workout, :id, :name, :goal, :start_date
end
