require 'pathname'
require 'fileutils'
require 'RMagick'

SavePath = './output1'
FileUtils.mkdir_p SavePath unless Dir.exist? SavePath

input_file = './pg0023-music01fc.pdf'

pdf_imagelist = Magick::ImageList.new(input_file)

pdf_imagelist.each_with_index do |page, i|
  output_file = Pathname.new(SavePath).join("%02d.png" % (i + 1))
  page.write(output_file)
end
