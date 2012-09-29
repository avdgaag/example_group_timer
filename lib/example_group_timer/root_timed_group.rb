module ExampleGroupTimer
  class RootTimedGroup < TimedGroup
    def initialize
      super(nil)
    end

    def indent
      0
    end

    def report_header
      puts "Total suite: #{duration}"
    end
  end
end
