require "spec_helper"

describe "Checking in" do
  let!(:ibeacon) { "k;asjdf;kasjdfasd" }
  let!(:cohort ) { Cohort.create! name: "Rails Engineering - Houston Q1 2016", beacon_id: ibeacon, campus_name: "Houston" }
  let!(:student) { Student.create! name: "Jesse Wo", email: "user@example.com", password: "sekret", cohort: cohort, phone_number: "7135555555" }
  let!(:day    ) { Day.create! cohort: cohort, start_time: 14.minutes.ago }
  let!(:checkin) { Checkin.create! student: student, day: day }

  let(:token) do

    auth_args = {
      "grant_type"    => "password",
      "username"      => student.email,
      "password"      => "sekret"
    }

    post "/oauth/token", auth_args, { "Accept" => "application/json" }

    JSON.parse(response.body)["access_token"]
  end

  it "Will error if beacon_id is wrong" do
    post "/api/checkin", {beacon_id: "WRONGZO2016"}, {"Accept" => "application/json", "Authorization" => "Bearer #{token}"}

    expect(response.status).to eq 422
  end

  it "Will set my current checkin to ok" do

    post "/api/checkin", {beacon_id: ibeacon}, {"Accept" => "application/json", "Authorization" => "Bearer #{token}"}

    expect(response.status).to eq 200

    checkin.reload
    expect(checkin.status).to eq("ok")
  end

  it "Will set my current checkin to late if I am late" do
    day.update(start_time: 30.minutes.ago)

    post "/api/checkin", {beacon_id: ibeacon}, {"Accept" => "application/json", "Authorization" => "Bearer #{token}"}

    expect(response.status).to eq 200

    checkin.reload
    expect(checkin.status).to eq("late")
  end

end
