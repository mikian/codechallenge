class Parser
  def initialize(string_io)
    @string_io = string_io
    @visits = Hash.new { |h, k| h[k] = Hash.new { |h, k| h[k] = 0 } }
  end

  def parse
    string_io.each_line do |line|
      path, remote_ip = line.split(' ')
      visits[path][remote_ip] += 1
    end
    self # Allows simple chaining
  end

  def result
    return {} if visits.empty?
    @result ||= {
      visits: visits.map { |p, v| [p, v.values.reduce(:+)] }.sort_by(&:last).reverse,
      unique: visits.map { |p, v| [p, v.keys.length] }.sort_by(&:last).reverse
    }
  end

  private

  attr_reader :string_io, :visits
end
