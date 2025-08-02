(ns bob
  (:require [clojure.string :as string]))

(defn any-alpha? [s]
  (not (empty? (re-seq #"[a-zA-Z]" s))))

(defn yelled? [s]
  (and (any-alpha? s)
       (= (string/upper-case s) s)))

(defn yelled-question? [s]
  (and (any-alpha? s)
       (= (string/upper-case s) s)
       (string/ends-with? s "?")))

(defn response-for [s]
  (let [s-trimmed (string/trim s)]
    (cond
      (string/blank? s-trimmed) "Fine. Be that way!"
      (yelled-question? s-trimmed) "Calm down, I know what I'm doing!"
      (yelled? s-trimmed) "Whoa, chill out!"
      (string/ends-with? s-trimmed "?") "Sure."
      :else "Whatever.")))
