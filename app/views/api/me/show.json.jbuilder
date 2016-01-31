json.student do
  json.email @student.email
  json.id @student.id
  json.name @student.name
  json.cohort do
    json.id @student.cohort.id
    json.name @student.cohort.name
    json.beacon_id @student.cohort.beacon_id
  end
end
