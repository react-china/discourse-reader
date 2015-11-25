
ns discourse-reader.app.user
  :require
    [] reagent.core :as r
    [] clojure.string :refer
      [] replace

def cdn |http://7xjtzg.com1.z0.glb.clouddn.com

def style-user $ {}
  :display :flex
  :align-items |center

defn style-avatar (avatar)
  {}
    :background-image $ str "|url(" cdn
      replace avatar |{size} |25
      , "|)"
    :width 25
    :height 25
    :background-color "|hsl(0,0%,90%)"

def style-name $ {}
  :font-size 14
  :margin-left 10

defn user-component (post)
  [] :div ({} :style style-user)
    [] :div ({} :style (style-avatar $ :avatar_template post))
    [] :div ({} :style style-name) (:display_username post)
