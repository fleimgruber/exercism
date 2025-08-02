(ns reverse-string)

(defn reverse-stringc [coll]
  (loop [c coll acc ""]
    (if (= 0 (count c))
      acc
      (recur (drop-last c) (str acc (last c) )))))
