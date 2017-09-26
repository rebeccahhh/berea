#lang racket
;; We must include the test engine.
(require test-engine/racket-tests)

;; http://docs.racket-lang.org/test-engine/index.html
;; has more information about the check- forms.

;; add-two
(define (add-two a b)
  (+ a b))

(check-expect (add-two 0 0) 0)
(check-expect (add-two 0 1) 1)
(check-expect (add-two 22 3847383) 3847405)

;; even-or-odd
(define (even-or-odd n)
  (if (even? n)
      "even"
      "odd"))

(check-expect (even-or-odd 3) "odd")
(check-expect (even-or-odd 0) "even")
(check-expect (even-or-odd 123948771023747982) "even")

;; distance to orgin
(define (dist-to-origin x y)
  (sqrt (+ (sqr x) (sqr y)))
  )

(check-within (dist-to-origin 4 16) 16.4 16.5)

(define (dist-p2p1 x y a b)
  (sqrt (+ (sqr(- a x)) (sqr(- b y))))
  )

(check-within (dist-p2p1 2 1 4 3) 2.8 2.85)
;; Run all the tests
;; We do that by invoking the test function, which
;; is provided by the racket-tests module.
(test)