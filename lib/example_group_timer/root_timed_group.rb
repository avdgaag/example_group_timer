module ExampleGroupTimer
  class RootTimedGroup < TimedGroup
    def initialize
      super(nil)
    end

    def indent
      0
    end

    def output
      @output ||= StringIO.new
    end

    def report
      puts '<div id="lists">'
      puts '<ol>'
      super
      puts '</ol>'
      puts '</div>'
    end

    def percentage
      100
    end

    def description
      'Spec suite'
    end

    def puts(*args)
      output.puts(*args)
    end
  end
end
