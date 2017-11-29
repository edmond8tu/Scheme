;;; Test cases for Scheme.
;;;
;;; In order to run only a prefix of these examples, add the line
;;;
;;; (exit)
;;;
;;; after the last test you wish to run.

(define x 2)
; expect x

(define (triangle? x y z)
  (= (+ (+ x y) z) 180)
  )
; expect triangle?

(triangle? 90 45 45)
; expect True

(triangle? 1 2 3)
; expect False

(define yeet
  (lambda (x y) (* x y))
  )
; expect yeet

(yeet 2 3)
; expect 6

(define name "Edmond")
name
; expect "Edmond"

(define favnum 3)
; expect favnum

favnum
;expect 3

(quote hello)
; expect hello

(quote (1 . 2))
; expect (1 . 2)

(- (+ (* 1000 2) 200) 100)
; expect 2100

(/ (+ 4000 (* 17 2)) (/ 16 8))
; expect 2017

(+ 1 2 3 4)
;expect 10

(abs -10000)
; expect 10000

(define (factorial n)
  (if (= n 0)
    1
    (* n (factorial (- n 1)))
    )
  )
; expect factorial

(factorial 2)
; expect 2

(factorial 6)
; expect 720

(cons 2 (cons 3 (list 1 2)))
; expect (2 3 1 2)

(define lst (list 1 2 3 4 5 6 7 8 9 10))
; expect lst

(car lst)
; expect 1

(cdr lst)
; expect (2 3 4 5 6 7 8 9 10)

(and 1 2)
; expect 2

(and True nil (/ 100 0))
; expect Error

(if (null? lst)
  'daddy
  'notdaddy
  )
; expect notdaddy

(define (nested? lst)
  (cond
    ((null? lst) False)
    ((pair? (car lst)) True)
    (else (nested? (cdr lst)))
    )
  )
; expect nested?

(nested? (cons (cons 2 nil) (cons 19 (cons 100 nil))))
; expect True

(nested? (cons 2 (cons 14 (cons (list 1 2 3 4 5) (cons 2 (cons (list 2 3 4) nil))))))
; expect True

(nested? (list 1 2 3 4 5))
; expect False

(begin (+ 2 3) (* 3 4))
; expect 12

(begin (* 2 8)  (lambda (x y) (+ x y)))
; expect (lambda (x y) (+ x y))

(begin (cons 1 2) (nested? (list 1 2 3 (list 2 3 4))))
; expect True

(begin (list 1 2 3 4) lst (cons 1 (cons 1 2)) (* (+ 2 3) 4) (cons 1 (cons 1 (cons 3 (cons 10 200)))))
; expect (1 1 3 10 . 200)

(begin 2 3 (define))
; expect Error

(define (find s lst)
  (cond 
    ((null? lst) 'not_there)
    ((= s (car lst)) 'found)
    (else (find s (cdr lst)))
    )
  )
; expect find

(find 2 (list 1 2 3))
; expect found

(find 3 (cons 40 (cons 17 (cons 3 nil))))
; expect found

(find 10 (list 1 2))
; expect not_there

100
; expect 100

(define a 2)
; expect a

a
; expect 2

-100
; expect -100

(define eapprox (+ 2 .7182))
; expect eapprox

eapprox
; 2.7182

(* eapprox 2)
; expect 5.4364 

(and (or 2 3) 2 (or 3))
; expect 3

(and (and) 2 (and 3 4) (or) 20)
; expect False

(and ((lambda (x y) (* x y)) 2 0) (or (cdr (cons 3 2))) 2 (or 79) (or))
; expect False

(or False #f (begin 2 (lambda (x) x)) (/ 1 0))
; expect (lambda (x) x)

(or (cons 2 3) False (list 1 2 3))
; expect (2 . 3)

(and (or 2 3 (cons 100 200)) (and) nil 'yaga (= (lambda (nuts) (+ nuts 1))))
; expect Error

(let ((a 2) (b 3)) (cons a b))
; expect (2 . 3)

(let ((a (list 1 2 3)) (b (cons 1 2)) (c (lambda (x) (+ x 1)))) (list a b c))
; expect ((1 2 3) (1 . 2) (lambda (x) (+ x 1)))

(let ((nuts 3) (func (lambda (punts) (* punts 2))) (c (/ 1 0))) (cons nuts (cons func c)))
; expect Error

(define ninja (mu (samurai) (+ samurai dog)))
; expect ninja

((lambda (cat dog) (ninja (* 3.14 (- 13 cat)))) 3 4)
; expect 35.400000000000006

(define reverse-divide
  (lambda (x y) (/ y x))
)
; expect reverse-divide

(reverse-divide 2 80)
; expect 40

(reverse-divide 11 14641)
; expect 1331

(reverse-divide 4 -1600)
; expect -400

(reverse-divide 21786 0)
; expect 0

(reverse-divide 0 25)
; expect Error

(define (outer a b)
  (define (inner x)
    (-(x (+ a b)))
  )
(inner x)
)
; expect outer

(outer 5 6)
; expect Error

(outer -65 83)
; expect Error

(define (outer a b c)
  (define (inner x)
    (- c (+ a b))
  )
(inner c)
)

(outer 1 2 3)
; expect 0

(outer 121 79 -50)
; expect -250

(quote (1 . (2 . (3 . (4 . (5))))))
; expect (1 2 3 4 5)

(quote (1 . (2 . 3)))
; expect (1 2 . 3)

(cdr (quote (a b c)))
; expect (b c)

(cdr (car (quote ((a b) c d))))
; expect (b)

(car (car (car (car (quote ((((1 2)))))))))
; expect 1

(cdr (car (car (car (quote (((hey world))))))))
; expect Error

(lambda (a b c) (+ (- a b) (- b c) (- a c)))
; expect (lambda (a b c) (+ (- a b) (- b c) (- a c)))

((lambda (a b c) (+ (- a b) (- b c) (- a c))) 1 2 3)
; expect -4

((lambda (a b c) (+ (- a b) (- b c) (- a c))) 1 2 3 4)
; expect Error

((lambda (a b) (lambda (x y) (* x y))) 3 4)
; expect (lambda (x y) (* x y))

((lambda (a b) ((lambda (x y) (* x y)) 1 2)) 3 4)
; expect 2

((lambda (a b) (* (+ a b) ((lambda (x y) (* x y)) 1 2))) 3 4)
; expect 14

(define (x y) (* y 15))
; expect x

(x 6)
; expect 90

(x a)
; expect 30

(define (func a b)(define (help z c)( * (+ z c) 5))(help 12 7))
; expect func

(func 4 2)
; expect 95

(define (func a b)(define (help z c)( * (+ z c) 5))( * (- a b) (help 12 7)))
; expect func

(func 5 3)
; expect 190

(func 4 5)
; expect -95

(cond
    ((> 1 2) 'yes)
    ((< -2 -1) 'no)
    (else 'hi))
; expect no

(cond
    ((= 7 8) 'okay)
    ((> 11 75) 'crazy)
    (else 'hm))
; expect hm

(cond
    ((= -6 6) 'wat)
    ((< 8 9))
    (else 'else))
; expect True

(cond
    ((= -9 -9) 'my 'name 'is 'paps)
    (else 'just 'kidding))
; expect paps

(cond
    ((!= 8 8) 'mess)
    (else 'hey 'computer 'science))
; expect Error

(define a 7)
; expect a

(define b -19)
; expect b

(define c 'say)
; expect c

(let ((a 13) (b (* a 2))) (list a b))
; expect (13 14)

(list a b)
; expect (7 -19)

(let ((a 15) (b 17) (c (+ a b))) (list a b c))
; expect (15 17 -12)

(list a b c)
; expect (7 -19 say)

(define func (mu (h) (* h (+ h k))))
; expect func

(define help (lambda (j k) (func (+ j j))))
; expect help

(help 1 2)
; expect 8

;;; These are examples from several sections of "The Structure
;;; and Interpretation of Computer Programs" by Abelson and Sussman.

;;; License: Creative Commons share alike with attribution

;;; 1.1.1

10
; expect 10

(+ 137 349)
; expect 486

(- 1000 334)
; expect 666

(* 5 99)
; expect 495

(/ 10 5)
; expect 2

(+ 2.7 10)
; expect 12.7

(+ 21 35 12 7)
; expect 75

(* 25 4 12)
; expect 1200

(+ (* 3 5) (- 10 6))
; expect 19

(+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6))
; expect 57

(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))
; expect 57

;;; 1.1.2

(define size 2)
; expect size
size
; expect 2

(* 5 size)
; expect 10

(define pi 3.14159)
(define radius 10)
(* pi (* radius radius))
; expect 314.159

(define circumference (* 2 pi radius))
circumference
; expect 62.8318


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Move the following (exit) line to run additional tests. ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (square x) (* x x))
; expect square
(square 21)
; expect 441

(define square (lambda (x) (* x x))) ; See Section 1.3.2
(square 21)
; expect 441

(square (+ 2 5))
; expect 49

(square (square 3))
; expect 81

(define (sum-of-squares x y)
  (+ (square x) (square y)))
(sum-of-squares 3 4)
; expect 25

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))
(f 5)
; expect 136

(f 8)
; expect 337

;;; 1.1.6

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
(abs -3)
; expect 3

(abs 0)
; expect 0

(abs 3)
; expect 3

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
(a-plus-abs-b 3 -2)
; expect 5

;;; 1.1.7

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (sqrt x)
  (sqrt-iter 1.0 x))
(sqrt 9)
; expect 3.00009155413138

(sqrt (+ 100 37))
; expect 11.704699917758145

(sqrt (+ (sqrt 2) (sqrt 3)))
; expect 1.7739279023207892

(square (sqrt 1000))
; expect 1000.000369924366

;;; 1.1.8

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))
(sqrt 9)
; expect 3.00009155413138

(sqrt (+ 100 37))
; expect 11.704699917758145

(sqrt (+ (sqrt 2) (sqrt 3)))
; expect 1.7739279023207892

(square (sqrt 1000))
; expect 1000.000369924366

;;; 1.3.1

(define (cube x) (* x x x))
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b))
(sum-cubes 1 10)
; expect 3025

(define (identity x) x)
(define (sum-integers a b)
  (sum identity a inc b))
(sum-integers 1 10)
; expect 55

;;; 1.3.2

((lambda (x y z) (+ x y (square z))) 1 2 3)
; expect 12

(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))
(f 3 4)
; expect 456

(define x 5)
(+ (let ((x 3))
     (+ x (* x 10)))
   x)
; expect 38

(let ((x 3)
      (y (+ x 2)))
  (* x y))
; expect 21

;;; 2.1.1

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define x (cons 1 2))
(car x)
; expect 1

(cdr x)
; expect 2

(define x (cons 1 2))
(define y (cons 3 4))
(define z (cons x y))
(car (car z))
; expect 1

(car (cdr z))
; expect 3

z
; expect ((1 . 2) 3 . 4)

(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))
(define (print-rat x)
  (display (numer x))
  (display '/)
  (display (denom x))
  (newline))
(define one-half (make-rat 1 2))
(print-rat one-half)
; expect 1/2

(define one-third (make-rat 1 3))
(print-rat (add-rat one-half one-third))
; expect 5/6

(print-rat (mul-rat one-half one-third))
; expect 1/6

(print-rat (add-rat one-third one-third))
; expect 6/9

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))
(print-rat (add-rat one-third one-third))
; expect 2/3

(define one-through-four (list 1 2 3 4))
one-through-four
; expect (1 2 3 4)

(car one-through-four)
; expect 1

(cdr one-through-four)
; expect (2 3 4)

(car (cdr one-through-four))
; expect 2

(cons 10 one-through-four)
; expect (10 1 2 3 4)

(cons 5 one-through-four)
; expect (5 1 2 3 4)

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))
(map abs (list -10 2.5 -11.6 17))
; expect (10 2.5 11.6 17)

(map (lambda (x) (* x x))
     (list 1 2 3 4))
; expect (1 4 9 16)

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))
(scale-list (list 1 2 3 4 5) 10)
; expect (10 20 30 40 50)

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))
(define x (cons (list 1 2) (list 3 4)))
(count-leaves x)
; expect 4

(count-leaves (list x x))
; expect 8

;;; 2.2.3

(define (odd? x) (= 1 (remainder x 2)))
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
(filter odd? (list 1 2 3 4 5))
; expect (1 3 5)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(accumulate + 0 (list 1 2 3 4 5))
; expect 15

(accumulate * 1 (list 1 2 3 4 5))
; expect 120

(accumulate cons nil (list 1 2 3 4 5))
; expect (1 2 3 4 5)

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
(enumerate-interval 2 7)
; expect (2 3 4 5 6 7)

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))
(enumerate-tree (list 1 (list 2 (list 3 4)) 5))
; expect (1 2 3 4 5)

;;; 2.3.1

(define a 1)

(define b 2)

(list a b)
; expect (1 2)

(list 'a 'b)
; expect (a b)

(list 'a b)
; expect (a 2)

(car '(a b c))
; expect a

(cdr '(a b c))
; expect (b c)

(define (memq item x)
  (cond ((null? x) false)
        ((equal? item (car x)) x)
        (else (memq item (cdr x)))))
(memq 'apple '(pear banana prune))
; expect False

(memq 'apple '(x (apple sauce) y apple pear))
; expect (apple pear)

(define (my-equal? x y)
  (cond ((pair? x) (and (pair? y)
                        (my-equal? (car x) (car y))
                        (my-equal? (cdr x) (cdr y))))
        ((null? x) (null? y))
        (else (equal? x y))))
(my-equal? '(1 2 (three)) '(1 2 (three)))
; expect True

(my-equal? '(1 2 (three)) '(1 2 three))
; expect False

(my-equal? '(1 2 three) '(1 2 (three)))
; expect False

;;; Peter Norvig tests (http://norvig.com/lispy2.html)

(define double (lambda (x) (* 2 x)))
(double 5)
; expect 10

(define compose (lambda (f g) (lambda (x) (f (g x)))))
((compose list double) 5)
; expect (10)

(define apply-twice (lambda (f) (compose f f)))
((apply-twice double) 5)
; expect 20

((apply-twice (apply-twice double)) 5)
; expect 80

(define fact (lambda (n) (if (<= n 1) 1 (* n (fact (- n 1))))))
(fact 3)
; expect 6

(fact 50)
; expect 30414093201713378043612608166064768844377641568960512000000000000

(define (combine f)
  (lambda (x y)
    (if (null? x) nil
      (f (list (car x) (car y))
         ((combine f) (cdr x) (cdr y))))))
(define zip (combine cons))
(zip (list 1 2 3 4) (list 5 6 7 8))
; expect ((1 5) (2 6) (3 7) (4 8))

(define riff-shuffle (lambda (deck) (begin
    (define take (lambda (n seq) (if (<= n 0) (quote ()) (cons (car seq) (take (- n 1) (cdr seq))))))
    (define drop (lambda (n seq) (if (<= n 0) seq (drop (- n 1) (cdr seq)))))
    (define mid (lambda (seq) (/ (length seq) 2)))
    ((combine append) (take (mid deck) deck) (drop (mid deck) deck)))))
(riff-shuffle (list 1 2 3 4 5 6 7 8))
; expect (1 5 2 6 3 7 4 8)

((apply-twice riff-shuffle) (list 1 2 3 4 5 6 7 8))
; expect (1 3 5 7 2 4 6 8)

(riff-shuffle (riff-shuffle (riff-shuffle (list 1 2 3 4 5 6 7 8))))
; expect (1 2 3 4 5 6 7 8)

;;; Additional tests

(apply square '(2))
; expect 4

(apply + '(1 2 3 4))
; expect 10

(apply (if false + append) '((1 2) (3 4)))
; expect (1 2 3 4)

(if 0 1 2)
; expect 1

(if '() 1 2)
; expect 1

(or false true)
; expect True

(or)
; expect False

(and)
; expect True

(or 1 2 3)
; expect 1

(and 1 2 3)
; expect 3

(and False (/ 1 0))
; expect False

(and True (/ 1 0))
; expect Error

(or 3 (/ 1 0))
; expect 3

(or False (/ 1 0))
; expect Error

(or (quote hello) (quote world))
; expect hello

(if nil 1 2)
; expect 1

(if 0 1 2)
; expect 1

(if (or false False #f) 1 2)
; expect 2

(define (loop) (loop))
(cond (false (loop))
      (12))
; expect 12

((lambda (x) (display x) (newline) x) 2)
; expect 2 ; 2

(define g (mu () x))
(define (high f x)
  (f))

(high g 2)
; expect 2

(define (print-and-square x)
  (print x)
  (square x))
(print-and-square 12)
; expect 12 ; 144

(/ 1 0)
; expect Error

(define addx (mu (x) (+ x y)))
(define add2xy (lambda (x y) (addx (+ x x))))
(add2xy 3 7)
; expect 13


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Scheme Implementations ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; len outputs the length of list s
(define (len s)
  (if (eq? s '())
    0
    (+ 1 (len (cdr s)))))
(len '(1 2 3 4))
; expect 4


;;;;;;;;;;;;;;;;;;;;
;;; Extra credit ;;;
;;;;;;;;;;;;;;;;;;;;


; Tail call optimization tests

(define (sum n total)
  (if (zero? n) total
    (sum (- n 1) (+ n total))))
(sum 1001 0)
; expect 501501

(define (sum n total)
  (cond ((zero? n) total)
        (else (sum (- n 1) (+ n total)))))
(sum 1001 0)
; expect 501501

(define (sum n total)
  (begin 2 3
    (if (zero? n) total
      (and 2 3
        (or false
          (begin 2 3
            (let ((m n))
              (sum (- m 1) (+ m total)))))))))
(sum 1001 0)
; expect 501501

(exit)

; call/cc primitive procedure tests

(define (function return)
  (return 'return-value)
  'after-return)

(function (lambda (x) x))
; expect after-return

(call/cc function)
; expect return-value

(call/cc (lambda (return) (return 'return-value) 'other-value))
; expect return-value

(define (helper-two return)
  (define (f cont) (cont 2) 3)
  (return (* 10 (call/cc f))))

(call/cc helper-two)
; expect 20

(define (hailstone n return)
        (print n)
        (if (= n 1)
            (return ()))
        (if (= 1 (modulo n 2))
            (hailstone (+ 1 (* 3 n)) return))
        (hailstone (quotient n 2) return))

(call/cc (lambda (cont) (hailstone 100 cont)))
; expect ()

(exit)

; macro tests

(define (map f lst)
    (if (null? lst)
        nil
        (cons
            (f (car lst))
            (map f (cdr lst)))))

(define-macro (for formal iterable body)
         (list 'map (list 'lambda (list formal) body) iterable))

(for i '(1 2 3)
    (if (= i 1)
        0
        i))
; expect (0 2 3)

(define (cadr s) (car (cdr s)))
(define (cars s) (map car s))
(define (cadrs s) (map cadr s))

(define-macro (leet bindings expr)
    (cons
        (list 'lambda (cars bindings) expr)
        (cadrs bindings)))

(define (square x) (* x x))
(define (hyp a b)
  (leet ((a2 (square a)) (b2 (square b))) (sqrt (+ a2 b2))))

(hyp 3 4)
; expect 5.000023178253949
