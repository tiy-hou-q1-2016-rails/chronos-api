json.student do
  json.email current_student.email
  json.id current_student.id
  json.phone_number current_student.phone_number
  json.name current_student.name
  json.cohort do
    json.id current_student.cohort.id
    json.name current_student.cohort.name
    json.beacon_id current_student.cohort.beacon_id
  end
end
