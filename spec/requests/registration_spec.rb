require "spec_helper"

describe "Registration" do
  let!(:ibeacon) { "k;asjdf;kasjdfasd" }
  let!(:cohort ) { create(:cohort, beacon_id: ibeacon) }


  it "will give 422 with errors if I have incorrect cohort code" do

    args = {
      name: "Jolie Washington",
      email: "jolie@example.com",
      password: "12345678",
      cohort_signup_code: "AAAA"
    }

    post "/api/register", args
    expect(response.status).to eq 422
  end

  it "will create student when correct signup code" do

    args = {
      name: "Jolie Washington",
      email: "jolie@example.com",
      password: "12345678",
      cohort_signup_code: "5a4r"
    }

    post "/api/register", args
    expect(response.status).to eq 201

    auth_args = {
      "grant_type"    => "password",
      "username"      => "jolie@example.com",
      "password"      => "12345678"
    }

    post "/oauth/token", auth_args, { "Accept" => "application/json" }

    token = JSON.parse(response.body)["access_token"]

    get "/api/me", {}, {"Accept" => "application/json", "Authorization" => "Bearer #{token}"}

    expect(response.status).to eq 200

    expect(JSON.parse(response.body)["student"]["email"]).to eq("jolie@example.com")

  end

end
