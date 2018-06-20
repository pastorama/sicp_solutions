#lang racket

;; exercise 1.3

;; Define a procedure that takes three numbers as arguments and returns the sum of the
;; squares of the two larger numbers.

(define (print-value comment value)
  (printf "Value: ~a (~a)\n" value comment))

(define (sum-of-two-largest-squares a b c)
  (define (square x) (* x x))
  (define (sum-three-squares a b c) (+ (square a) (square b) (square c)))
  (define (get-min-from-three a b c)
    (cond
      ((and (>= a c) (>= b c)) c)
      ((and (>= b a) (>= c a)) a)
      ((and (>= c b) (>= a b)) b)))
  (- (sum-three-squares a b c) (square( get-min-from-three a b c))))

(print-value "for 5 2 3" (sum-of-two-largest-squares 5 2 3))
(print-value "for 3 3 3" (sum-of-two-largest-squares 3 3 3))
(print-value "for 1 1 3" (sum-of-two-largest-squares 1 1 3))
  