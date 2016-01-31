require "spec_helper"

describe "API" do

  it "unauthenticated should 401" do
    get api_me_path
    expect(response.status).to eq(401)
  end

  it "With student created, can get my information" do

    cohort  = Cohort.create! name: "Rails Engineering - Houston Q1 2016", beacon_id: "yolo2016", campus_name: "Houston", cohort_signup_code: "5a4r"
    student = Student.create! name: "Jesse Wo", email: "user@example.com", password: "sekret", cohort: cohort

    auth_args = {
      "grant_type"    => "password",
      "username"      => "user@example.com",
      "password"      => "sekret"
    }

    post "/oauth/token", auth_args, { "Accept" => "application/json" }

    token = JSON.parse(response.body)["access_token"]

    get "/api/me", {}, {"Accept" => "application/json", "Authorization" => "Bearer #{token}"}

    expect(response.status).to eq 200

    expect(JSON.parse(response.body)["student"]["email"]).to eq("user@example.com")

  end
end
