#!/usr/bin/env bb
(require '[clojure.java.shell :as sh]
         '[cheshire.core :as json])


;; TODO  This script is a little sluggish. Try it in bash see if that helps.
;; FIXME This causes the script to stop working when called from skhdrc. Works ok run from here, but bound to a key, nothing...
;; (require 'utils)


(defn current-space
  "Returns the currently active space"
  []
  (get
    (json/parse-string
      (:out (sh/sh "yabai" "-m" "query" "--spaces" "--space") true))
    "index"))


(defn current-display
  "Returns the currently active display number"
  []
  (get
    (json/parse-string
      (:out (sh/sh "yabai" "-m" "query" "--displays" "--display") true))
    "index"))


(defn spaces
  "Given a display number, returns a list of all the spaces on it."
  [current-display]
  (map
    #(get % "index")
    (json/parse-string
      (:out (sh/sh "yabai" "-m" "query" "--spaces" "--display" (str current-display))))))


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


(defn next-space
  "returns the index of the next space on the current display"
  []
  (let [display (current-display)
        space   (current-space)]
    (next-entry space (spaces display))))


(sh/sh "yabai" "-m" "space" "--focus" (str (next-space)))
