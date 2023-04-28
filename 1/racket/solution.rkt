#lang racket

(define (div-by val)
  (lambda (tst)
    (= (modulo tst val) 0)))

(let ((div-by-3 (div-by 3))
      (div-by-5 (div-by 5)))
  (for/sum ([val (in-range 3 1000)])
    (if (or (div-by-3 val) (div-by-5 val))
        val
        0)))
