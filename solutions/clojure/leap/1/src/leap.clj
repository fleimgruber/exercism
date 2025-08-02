(ns leap)

(defn divisible? [year number]
  (= (mod year number) 0))

(defn leap-year?
  "Determine if a year is a leap year"
  [year]
  (and (divisible? year 4)
       (or (not (divisible? year 100))
           (divisible? year 400))))
