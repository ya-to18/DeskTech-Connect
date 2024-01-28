crumb :root do
  link "みんなの投稿", posts_path
end

crumb :show_post do |post|
  link "#{post.user.name}さんの投稿", post_path(post.id)
end

crumb :edit_post do |post|
  link "編集", posts_path(post.id)
  parent :show_post, post
end

crumb :new_post do
  link "新規投稿", new_post_path
  parent :root
end

crumb :rank_post do
  link "人気ランキング", rank_path
  parent :root
end

crumb :liked_post do
  link "いいね！した投稿", likes_users_path
end

crumb :my_post do
  link "自分の投稿", posts_users_path
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