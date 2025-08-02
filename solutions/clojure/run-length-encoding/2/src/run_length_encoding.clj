(ns run-length-encoding
  (:require [clojure.string :as str]))

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (->> (partition-by identity plain-text)
       (map #(str (if (> (count %) 1) (count %) "") (first %)))
       (apply str)))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (str/replace cipher-text #"(\d+)(\D)"
               (fn [[_ c l]] (apply str (repeat (read-string c) l)))))
