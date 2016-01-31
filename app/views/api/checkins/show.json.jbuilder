json.checkin do
  json.start_time_utc = @checkin.checkin_at.to_i
  json.start_time = @checkin.checkin_at
  json.status @checkin.status
  json.start_dtime @checkin.day.start_time
end
