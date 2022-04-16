require 'pathname'
require 'fileutils'
require 'RMagick'

InputPath = './output1'
SavePath = './output2'
FileUtils.mkdir_p SavePath unless Dir.exist? SavePath

q_number = 0
Dir.glob(File.join(InputPath, '*.png')).sort.each do |file|
  basename = File.basename(file, '.png')
  p basename
  image = Magick::ImageList.new(file).first
  width = image.columns
  height = image.rows
  out_width = (width - 1) / 2 - 1
  out_height = (height - 1) / 2 - 20

  q_number += 1
  q1 = image.crop(0, 0, out_width, out_height)
  q1.write(Pathname.new(SavePath).join("#{q_number}q.png"))
  a1 = image.crop(width - out_width, 0, out_width, out_height)
  a1.write(Pathname.new(SavePath).join("#{q_number}a.png"))
  q_number += 1
  q2 = image.crop(0, height - out_height, out_width, out_height)
  q2.write(Pathname.new(SavePath).join("#{q_number}q.png"))
  a2 = image.crop(width - out_width, height - out_height, out_width, out_height)
  a2.write(Pathname.new(SavePath).join("#{q_number}a.png"))
end
