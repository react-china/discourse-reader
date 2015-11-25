
ns discourse-reader.app.post
  :require
    [] reagent.core :as r
    [] discourse-reader.app.user :refer
      [] user-component

def style-post $ {}
  :line-height |24px
  :font-size |14px
  :margin-top 10
  :display |flex
  :flex-direction |column
  :border "|1px solid hsl(0,0%,94%)"
  :background-color "|hsl(0,0%,97%)"
  :padding 10

def style-content $ {}

def style-name $ {}

defn post-component (post)
  [] :div ({} (:style style-post))
    [] user-component post
    [] :div
      {} (:style style-content)
        :dangerouslySetInnerHTML $ {}
          :__html (:cooked post)
