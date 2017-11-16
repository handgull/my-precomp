require '../shared/path'
require '../shared/lang'
class PagesController
  def minimizer(page, type)
    if type == "php"
      return minimizer(page, "html").sub("<?php", "<?php\n").gsub(/\/\*(.|\n)*\*\//, "")
    else
      return page.gsub("\n", "").gsub(/<!--[^\[].*-->/, "").gsub(/> +</, "><")
    end
  end
  # usually i like to create a index that only redirect to your language site,
  # so the index doesn't need any translation.
  def build_index
    file = File.read(File.expand_path("partials/_index.php"))
  	index = Pathr.new.linker(file)
    print minimizer(index, "php")
  end
  def build_errorp(page)
    path = "partials/_" + page
    page = Langw.new.write(page, "")
    page = Pathr.new.linker(File.expand_path(path))
    print minimizer(page, "html")
  end
  def build_page(page, lang)
  	path = "partials/_" + page
    page = Langw.new.writer(File.expand_path(path), lang)
  	page = Pathr.new.linker(page)
    print minimizer(page, "php")
  end
end
