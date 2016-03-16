require "./spec_helper"

include YYMMDD

describe YYMMDD do
  it "defines #yyyy method that formats year" do
    yyyy.to_s.should eq Time.now.to_s("%Y")
  end

  it "defines #yy method that formats year with two digits" do
    yy.to_s.should eq Time.now.to_s("%y")
  end

  it "defines #y method that formats year with two digits" do
    yy.to_s.should eq Time.now.to_s("%y")
  end

  it "defines #mm method that formats month" do
    mm.to_s.should eq Time.now.to_s("%m")
  end

  it "defines #m method that formats month with one digit" do
    m.to_s.should eq Time.now.to_s("%-m")
  end

  it "defines #dd method that formats day" do
    dd.to_s.should eq Time.now.to_s("%d")
  end

  it "defines #d method that formats day with one digit" do
    d.to_s.should eq Time.now.to_s("%-d")
  end

  context "operators" do
    it "is able to be used with '/'" do
      (yyyy.mm.dd).to_s.should eq Time.now.to_s("%Y.%m.%d")
    end

    it "is able to be used with '/'" do
      (yyyy/mm/dd).to_s.should eq Time.now.to_s("%Y/%m/%d")
    end

    it "is able to be used with '-'" do
      (yyyy-mm-dd).to_s.should eq Time.now.to_s("%Y-%m-%d")
    end

    it "is able to be used with '|'" do
      (yyyy|mm|dd).to_s.should eq Time.now.to_s("%Y|%m|%d")
    end
  end

  context "arguments" do
    it "accepts Time object" do
      time = Time.new 2017, 1, 5
      (yyyy-mm-dd time).to_s.should eq "2017-01-05"
    end
  end
end
