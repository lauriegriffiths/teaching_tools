class ArticleWorksheet < ActiveRecord::Base
  belongs_to :user


  def body_with_no_articles
  articles = ['the','a','an']
    articles_removed = body.split.map(& :downcase).map do |w|
      if articles.include?(w)
        "_____"
      else
        w
      end
    end
    articles_removed.join(" ")
  end
end
