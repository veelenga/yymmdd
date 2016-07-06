require "./yymmdd/*"

module YYMMDD
  TIME_FORMATS = {
    "yyyy" => "%Y",
    "yy"   => "%y",
    "y"    => "%y",
    "mm"   => "%m",
    "m"    => "%-m",
    "dd"   => "%d",
    "d"    => "%-d",
  }

  {% for fmt in TIME_FORMATS.keys %}
    def {{fmt.id}}(time : Time = nil)
      Date.new {{fmt}}, time
    end
  {% end %}

  class Date

    {% for fmt in TIME_FORMATS.keys %}
      def {{fmt.id}}(time : Time = nil)
        process Date.new({{fmt}}, time), "."
      end
    {% end %}

    getter format, time

    def initialize(@format : String, @time : Time? = nil)
      @parts = [{ self, "" }]
    end

    def /(part : Date = nil)
      process(part, "/")
    end

    def -(part : Date = nil )
      process(part, "-")
    end

    def |(part : Date = nil)
      process(part, "|")
    end

    def to_s(io : IO)
      format self, io
    end

    def inspect(io : IO)
      format self, io
    end

    protected def parts
      @parts.not_nil!
    end

    private def process(part, del)
      parts << { part, del }
      self
    end

    private def format(date : Date, io : IO = nil)
      time = date.parts.last[0].time || Time.now
      fmt  = date.parts.map { |part| sprintf("%s%s", part[1], TIME_FORMATS[part[0].format]) }.join("")
      io ? time.to_s(fmt, io) : time.to_s fmt
    end
  end
end
