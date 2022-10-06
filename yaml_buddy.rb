# frozen_string_literal: true

# Module that can be included (mixin) to take and output yml data

TAB = "\t"
NEWLINE = "\n"

module YamlBuddy
  COLUMNS_NAME = %w[date student_id languages best_language app_experience tech_experience]

  def row_strip_space_and_quotes(row)
    row.strip.delete_prefix("'").delete_suffix("'")
  end

  def take_yaml(yml)
    yml = yml.split(NEWLINE)
    yml = yml.drop(1)

    @data = []

    yml.each do |row|
      if row[0..1] == '- '
        @data.push([])
        @data[-1].push(row[2..].split(':', 2).map { |s| (s) })
      elsif row[0..3] != '    '
        @data[-1].push(row[2..].split(':', 2).map { |s| (s) })
      else
        #@data[-1][-1][1] += ' ' + row_strip_space_and_quotes(row)
        @data[-1][-1][1] += row
      end
    end

    @data = @data.map { |a| a.to_h }
  end

  def to_yaml
    s = '---'
    s += NEWLINE
    @data.each do |d|
      d.each_with_index do |hash, index|
        s += if index == 0
               '- '
             else
               '  '
             end
        s += "#{hash[0]}: #{hash[1]}#{NEWLINE}"
      end
    end
    s
  end
end
