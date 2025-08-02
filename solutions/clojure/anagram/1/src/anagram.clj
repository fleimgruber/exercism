(ns anagram
  (:require [clojure.string :as str]))

(defn -true-anagram [word candidate]
  (when-not (= word candidate)
    (and
     (or (= word (str/lower-case word))
         (= word (str/capitalize word)))
     (= (sort (str/lower-case word))
        (sort (str/lower-case candidate))))))

(defn anagrams-for [word prospect-list]
  (filter #(-true-anagram word %) prospect-list))
