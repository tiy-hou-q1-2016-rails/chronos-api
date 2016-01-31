require 'spec_helper'
require 'delorean'

describe "DailyBook" do

  let!(:ibeacon) { "k;asjdf;kasjdfasd" }
  let!(:cohort ) { create(:cohort, beacon_id: ibeacon) }
  let(:valid_monday) { "2016-02-01".to_date }

  before(:each) { Delorean.time_travel_to(valid_monday)}
  after(:each) { Delorean.back_to_the_present }

  it "will create a day for today" do
    expect(cohort.days.count).to eq(0)

    DailyBook.create_for(cohort)
    expect(cohort.days.count).to eq(1)
    expect(cohort.days.first.start_time.utc.hour).to eq(15)
    expect(cohort.days.first.start_time.utc.min).to eq(30)
  end

  it "will create n number of students" do
    students = 5.times.map do
      create(:student, cohort: cohort)
    end

    DailyBook.create_for(cohort)

    students.each do |student|
      expect(Checkin.today.for_student(student).status).to eq("pending")
    end

  end

  it "will set any previous to absent if still pending" do
    student = create(:student, cohort: cohort)

    d1 = Day.create! cohort: cohort, start_time: 3.days.ago
    d2 = Day.create! cohort: cohort, start_time: 2.days.ago
    d3 = Day.create! cohort: cohort, start_time: 1.day.ago

    [d1, d2, d3].each { |day| Checkin.create(student: student, day: day) }

    DailyBook.create_for(cohort)

    [d1,d2,d3].each do |day|
      expect(student.checkins.find {|c| c.day == day}.status).to eq("absent")
    end

  end

  it "will not create if it's a weekend" do
    student = create(:student, cohort: cohort)

    saturday = "2016-01-30".to_date
    sunday = "2016-01-31".to_date

    [saturday, sunday].each do |day|
      Delorean.time_travel_to(day) do
        initial_count = Checkin.count

        DailyBook.create_for(cohort)

        expect(Checkin.count).to eq(initial_count)
      end
    end
  end

  it "won't create past the cohort's end date" do
    skip "we have 60 days!"
  end

  it "won't create on holidays for the cohort" do
    skip "we have 60 days!"
  end

end
