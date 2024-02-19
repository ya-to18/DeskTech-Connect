module ApplicationHelper
  include Pagy::Frontend

  def default_meta_tags
    {
      site: 'DeskTech-Connect',
      title: '自分のデスク環境を共有するサービス',
      reverse: true,
      charset: 'utf-8',
      description: 'DeskTech-Connectを使用すれば、自分のデスクを共有する事ができます。',
      keywords: 'デスク,パソコン,ガジェット',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        # image: image_url('ogp.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@',
        image: image_url('ogp/twitter_ogp.png')
      }
    }
  end

  def page_title(page_title = '')
    base_title = 'DeskTech-Connect'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def truncate_name(name)
    truncate(name, length: 40, omission: '...')
  end
end
