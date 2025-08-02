(ns isbn-verifier
  (:require [clojure.string :as str]))

(defn- isbn->nums [isbn]
  (->> (str/escape isbn {\X \a \- ""})
       (mapv #(Character/digit ^Character % 16))))

(defn- checksum? [nums]
  (let [divisible-by? #(zero? (rem %2 %))]
    (->> (map * nums (range 10 0 -1))
         (reduce +)
         (divisible-by? 11))))

(defn isbn? [s]
  (and (some? (re-matches #"(?:\d-?){9}[\dX]" s))
       (checksum? (isbn->nums s))))
