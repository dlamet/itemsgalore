class TabParser < ItemParser

  def parse(file_name)
    keys = nil
    items = []
    File.open(file_name).each do |line|
      if (keys.nil?)
        keys = digest_line(line)
        keys.map! { |key| key.sub(' ', '_')  }
      else
        values = digest_line(line)
        new_item = create_item(keys, values)
        items << new_item if new_item
      end
    end
    return items
  end

  def digest_line(line)
    line.split("\t").map { |value| value.strip  }
  end

end