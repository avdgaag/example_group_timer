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

    def report
      template = <<-EOS
<li>
  <div class="example-group">
    <span class="title">%s</span>
    <span class="duration">%s</span>
    <span class="share">%s</span>
  </div>
</li>
EOS
      puts template % [description, duration, percentage]
    end

    def description
      item.description.strip
    end

    def puts(*args)
      parent.puts *args
    end
  end
end
