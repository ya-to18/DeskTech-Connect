crumb :root do
  link "HOME", my_page_path
end

crumb :show_post do |post|
  link "#{post.user.name}さんの投稿", post_path(post.id)
  if request.referer == posts_url
    parent :posts_index
  else
    parent :root
  end
end

crumb :edit_post do |post|
  link "編集", posts_path(post.id)
  parent :show_post, post
end

crumb :new_post do
  link "新規投稿", new_post_path
  parent :root
end

crumb :posts_index do
  link "みんなの投稿", posts_path
end

crumb :rank_post do
  link "人気ランキング", rank_path
end

crumb :liked_post do
  link "いいね！した投稿", likes_users_path
end

crumb :my_post do
  link "自分の投稿一覧", posts_users_path
end

crumb :setting do
  link "個人設定", users_path
end