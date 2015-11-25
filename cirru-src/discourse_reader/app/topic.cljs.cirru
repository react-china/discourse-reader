
ns discourse-reader.app.topic
  :require
    [] reagent.core :as r
    [] discourse-reader.store :as store
    [] discourse-reader.app.post :refer
      [] post-component

def style-topic $ {}
  :height |100%
  :flex 1
  :overflow |auto
  :padding "|10px 10px 300px 0"

def style-title $ {}
  :background-color |white
  :padding "|10px"

defn topic-component (topic)
  [] :div ({} (:style style-topic))
    [] :div ({} (:style style-title)) (:title topic)
    let
        posts $ :posts $ :post_stream topic
      for
        [] post posts
        [] post-component post
