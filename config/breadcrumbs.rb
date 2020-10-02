crumb :root do
  link "Home", root_path
end

crumb :new_item do
  link "商品詳細", new_item_path
  parent :root
end

crumb :item do
  link "商品詳細", item_path
  parent :root
end

crumb :search_items do
  link "検索", search_items_path
  parent :root
end

crumb :item_edit do
  link "商品編集", item_path
  parent :item
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).