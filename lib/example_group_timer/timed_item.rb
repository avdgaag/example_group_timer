module ExampleGroupTimer
  class TimedItem
    attr_reader :item, :parent

    def initialize(item, parent = nil)
      @item, @parent = item, parent
      start
    end

    def start
      @started_at = Time.now
    end

    def finish
      @finished_at = Time.now
    end

    def duration
      '%.5f' % [@finished_at - @started_at]
    end

    def indent
      parent.indent + 1
    end

    def percentage
      ('%.1f%' % [(duration.to_f / parent.duration.to_f) * 100]).rjust(5)
    end

    def report_header
      truncated = (('  ' * indent) + item.description.strip)[0..59].ljust(60)
      puts "#{truncated} #{duration} #{percentage}"
    end
  end
end
