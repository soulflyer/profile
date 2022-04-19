#!/usr/bin/env bb
(require '[clojure.java.shell :as sh]
         '[cheshire.core :as json])


(defn current-display
  "Returns the currently active display number"
  []
  (get
    (json/parse-string
      (:out (sh/sh "yabai" "-m" "query" "--displays" "--display") true))
    "index"))


(defn next-entry
  "returns the index of the next entry after <n> in <list>, looping back to the begining if <n> is the last entry in the list"
  [n list]
  (if (or
        (= n (last list))
        (= 1 (count list)))
    (first list)
    (if (= n (first list))
      (first (rest list))
      (next-entry n (rest list)))))


(defn displays
  "~Returns a list of all the displays"
  []
  (map
    #(get % "index")
    (json/parse-string
      (:out (sh/sh "yabai" "-m" "query" "--displays")))))


(defn next-display
  "returns the index of the next space on the current display"
  []
  (let [display (current-display)]
    (next-entry display (displays))))


(sh/sh "yabai" "-m" "display" "--focus" (str (next-display)))
