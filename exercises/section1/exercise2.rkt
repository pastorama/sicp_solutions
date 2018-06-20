#lang racket

;; exercise 1.2

;; first way is quite confusing
;; it's better to split values and define abstractions

(define (print-value comment value)
  (printf "Value: ~a (~a)\n" value comment))

(print-value "first case" (/
  (+
    5
    4
    (-
      2
      (-
        3
        (+
          6
          (/ 4 5)))))
  (*
    (- 6 2)
    (- 2 7))))

(define subtrahend1 (+ 6 (/ 4 5)))
(define subtrahend2 (- 3 subtrahend1))
(define term (- 2 subtrahend2))

(define enumarator (+ 5 4 term))
(define denumerator (* (- 6 2) (- 2 7)))

(print-value "second value" (/ enumarator denumerator))