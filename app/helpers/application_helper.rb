module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "OSCA Hub"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
       no_intra_emphasis: true,
       fenced_code_blocks: true,
       disable_indented_code_blocks: true,
       autolink: true)
    return markdown.render(text).html_safe
  end
end
