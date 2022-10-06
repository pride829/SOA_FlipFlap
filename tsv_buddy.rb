# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  TAB = "\t"
  NEWLINE = "\n"

  def split_tsv(tsv)
    tsv.split(NEWLINE)
  end

  def split_row(row)
    row.chomp.split(TAB)
  end

  def named_values(headers, column)
    headers.zip(column).to_h
  end

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    splitted_rows = split_tsv(tsv).map { |row| split_row(row) }
    headers = splitted_rows.first
    @data = splitted_rows.drop(1).map { |col| named_values(headers, col) }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    columns = @data.first.keys
    s = columns.join(TAB) + NEWLINE
    @data.each do |splitted_row|
      s += splitted_row.values.join(TAB) + NEWLINE
    end
    s
  end
end
