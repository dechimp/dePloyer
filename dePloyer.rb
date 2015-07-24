class DePloyer
  attr_accessor :dir

  def initialize (options)
    @dir = options[:dir]
    @repo = options[:repo]
    raise ArgumentError.new("dir option not defined") unless @dir
  end

  def set_permissions
    `sudo chmod -R 777 #{@dir}`
  end

  def clone
    `git clone #{@repo} #{@dir}`
  end

  def backup
    `cp #{@dir} backups/#{@dir}_$(date +%F_%T)`
  end
end
