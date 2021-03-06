require "spec_helper"

describe "Viewing History" do
  let!(:ibeacon) { "k;asjdf;kasjdfasd" }
  let!(:cohort ) { create(:cohort, beacon_id: ibeacon) }
  let!(:student) { create(:student, cohort: cohort, password: "sekret")}

  let(:token) do

    auth_args = {
      "grant_type"    => "password",
      "username"      => student.email,
      "password"      => "sekret"
    }

    post "/oauth/token", auth_args, { "Accept" => "application/json" }

    JSON.parse(response.body)["access_token"]
  end

  it "Will returns my history" do
    day_1 = Day.create! cohort: cohort, start_time: 1.days.ago
    day_2 = Day.create! cohort: cohort, start_time: 2.days.ago
    day_3 = Day.create! cohort: cohort, start_time: 3.days.ago
    Checkin.create! student: student, day: day_1, status: "ok"
    Checkin.create! student: student, day: day_2, status: "ok"
    Checkin.create! student: student, day: day_3, status: "ok"


    get "/api/me/history", {}, {"Accept" => "application/json", "Authorization" => "Bearer #{token}"}

    expect(response.status).to eq 200
    checkins = JSON.parse(response.body)["checkins"]
    expect(checkins.count).to eq(3)
  end

end
