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


(defn hello
  []
  "Hello there")
