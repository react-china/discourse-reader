
ns discourse-reader.app.post
  :require
    [] reagent.core :as r

def style-post $ {}

def style-content $ {}

def style-name $ {}

defn post-component (post)
  [] :div ({} (:style style-post))
    [] :div ({} (:style style-name)) (:username post)
    [] :div
      {} (:style style-content)
        :dangerouslySetInnerHTML $ {}
          :__html (:cooked post)
