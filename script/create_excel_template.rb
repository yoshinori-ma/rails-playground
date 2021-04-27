# frozen_string_literal: true

class CreateBuildingOutlineSheetService
  def self.call(*args, **kwargs)
    new(*args, **kwargs).call
  end

  def initialize(package:)
    @package = package
    @max_col_width = 19 # 19列確保する
    wb = @package.workbook
    @sheet = wb.add_worksheet(name: 'シート名')
  end

  def call
    add_header_row
    add_one_column_row('hoge')
    add_one_column_row('hoge')
    add_one_column_row('hoge')
    add_two_column_row('hoge', 'hoge')
    add_two_column_row('hoge', 'hoge')
    add_two_column_row('hoge', 'hoge')
    add_two_column_row('hoge', 'hoge')
    add_two_column_row('hoge', 'hoge')
    add_two_column_row('hoge', 'hoge')

    # 基本ヘッダー 縦
    add_vertical_header('A2', 'A10', '基本')

    # 最後にボーダー処理
    sheet.rows.each do |row|
      row.cells.each do |cell|
        cell.add_style surround_border_style
      end
    end

    # sheet.column_widths(*1 * max_col_width)
    sheet.add_style 'A1:S1', border_top: { style: :thick, color: '000000' },
                             border_bottom: { style: :thick, color: '000000' }
    sheet.add_style 'A1:A10', border_left: { style: :thick, color: '000000' }
    sheet.add_style 'S1:S10', border_right: { style: :thick, color: '000000' }
    sheet.add_style 'A10:S10', border_bottom: { style: :thick, color: '000000' }

    sheet.column_info[col_to_index('A')].width = 4
    sheet.column_info[col_to_index('B')].width = 8
    sheet.column_info[col_to_index('C')].width = 8
    sheet.column_info[col_to_index('D')].width = 8
    sheet.column_info[col_to_index('O')].width = 10
  end

  private

  attr_accessor :max_col_width, :relative_position_x, :relative_position_y, :sheet

  # @param [String] col_name
  # @return [Integer] index
  def col_to_index(col_name)
    ('A'..'ZZ').to_a.index(col_name)
  end

  # @param [Integer] index
  # @return [String] col_name
  def index_to_col(index)
    ('A'..'ZZ').to_a[index]
  end

  def header_style
    { bg_color: 'CCCCCC', alignment: { horizontal: :center, vertical: :center, wrap_text: false } }
  end

  def surround_border_style
    { border: { style: :thin, color: '000000' } }
  end

  # 行に対して必要な分セルを作成する
  def add_cell_sheet_width(row)
    max_col_width.times { row.add_cell nil }
  end

  def add_header_row
    sheet.add_row do |r|
      add_cell_sheet_width(r)
      r.height = 40
      row_num = r.row_index + 1
      sheet["A#{row_num}"].add_style header_style
      sheet["A#{row_num}"].value = 'hoge'
      sheet.merge_cells "A#{row_num}:D#{row_num}"
      sheet.merge_cells "E#{row_num}:N#{row_num}"
      sheet.merge_cells "O#{row_num}:P#{row_num}"
      sheet["O#{row_num}"].add_style header_style
      sheet["O#{row_num}"].value = 'hoge'
      sheet.merge_cells "Q#{row_num}:S#{row_num}"
    end
  end

  # データが１個しか入らない列レイアウト作成
  def add_one_column_row(header)
    sheet.add_row do |r|
      row_num = r.row_index + 1
      add_cell_sheet_width(r)
      r.height = 20
      sheet.merge_cells "B#{row_num}:D#{row_num}"
      sheet["B#{row_num}"].add_style header_style
      sheet["B#{row_num}"].value = header
      sheet.merge_cells "E#{row_num}:S#{row_num}"
    end
  end

  # データが2個の列レイアウト作成
  def add_two_column_row(header, header2)
    sheet.add_row do |r|
      row_num = r.row_index + 1
      add_cell_sheet_width(r)
      r.height = 20
      sheet.merge_cells "B#{row_num}:D#{row_num}"
      sheet["B#{row_num}"].add_style header_style
      sheet["B#{row_num}"].value = header
      sheet.merge_cells "E#{row_num}:J#{row_num}"

      sheet.merge_cells "K#{row_num}:M#{row_num}"
      sheet["K#{row_num}"].add_style header_style
      sheet["K#{row_num}"].value = header2
      sheet.merge_cells "N#{row_num}:S#{row_num}"
    end
  end

  # @param [String] from 開始位置
  # @param [String] to 終了位置
  # @param [String] header 文言
  def add_vertical_header(from, to, header)
    sheet.merge_cells "#{from}:#{to}"
    sheet[from].add_style header_style
    # sheet[from].add_style(textRotation: 255) きかない
    sheet[from].value = header
  end
end

package = Axlsx::Package.new
CreateBuildingOutlineSheetService.call(package: package)
package.serialize('simple.xlsx')

# gem 'caxlsx'
# gem 'axlsx-styler'
