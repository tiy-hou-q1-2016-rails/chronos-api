require "spec_helper"

describe "API" do

  let(:cohort ) { create(:cohort) }
  let(:student) { create(:student, cohort: cohort, password: "sekret")}

  it "unauthenticated should 401" do
    get api_me_path
    expect(response.status).to eq(401)
  end

  it "With student created, can get my information" do


    auth_args = {
      "grant_type"    => "password",
      "username"      => student.email,
      "password"      => "sekret"
    }

    post "/oauth/token", auth_args, { "Accept" => "application/json" }

    token = JSON.parse(response.body)["access_token"]

    get "/api/me", {}, {"Accept" => "application/json", "Authorization" => "Bearer #{token}"}

    expect(response.status).to eq 200

    expect(JSON.parse(response.body)["student"]["email"]).to eq(student.email)

  end
end
