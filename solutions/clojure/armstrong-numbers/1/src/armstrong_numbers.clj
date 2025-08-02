(ns armstrong-numbers)

(defn armstrong? [num]
  (let [digits (map #(Character/digit % 10) (str num))]
    (== num
        (reduce + (map #(Math/pow % (count digits)) digits)))))
