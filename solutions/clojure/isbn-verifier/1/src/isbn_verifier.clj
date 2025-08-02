(ns isbn-verifier
  (:require [clojure.string :as str]))

(defn omit-chars [string chars]
  (apply str (remove #((set chars) %) string)))

(defn normalize-isbn [isbn]
  (omit-chars isbn "-"))

(defn -only-digits [s]
  (every? #(Character/isDigit %) s))

(defn -valid-length [isbn-norm]
  (= 10 (count isbn-norm)))

(defn -valid-last-character [isbn-norm]
  (let [last (last isbn-norm)]
    (or (= \X last)
        (Character/isDigit last))))

(defn -valid-butlast [isbn-norm]
  (-only-digits (butlast isbn-norm)))

(defn valid-input [isbn-norm]
  (and (-valid-length isbn-norm)
       (-valid-last-character isbn-norm)
       (-valid-butlast isbn-norm)))

(defn isbn-digits [isbn-norm]
  (concat (map #(Integer. %) (str/split (apply str (butlast isbn-norm)) #""))
          [(if (= \X (last isbn-norm))
             10
             (Integer/parseInt (str (last isbn-norm))))]))

(defn valid-checksum [isbn-norm]
  (let [digits (isbn-digits isbn-norm)]
    (= (mod
        (reduce #'+ 0 (map #'* digits (reverse (range 1 11)))) 11) 0)))

(defn isbn? [isbn]
  (let [isbn-norm (normalize-isbn isbn)]
    (if (not (valid-input isbn-norm))
      false
      (valid-checksum isbn-norm))))
