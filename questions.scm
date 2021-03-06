(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests)
  (cond
    ((null? rests) nil)
    (else (map (lambda (x) (cons first x)) rests))
    )
  )

(define (zip pairs)
  (define (make lst)
    (cond
      ((null? lst) nil)
      (else (cons (caar lst) (make (cdr lst))))  
      )
    )

  (cond
    ((null? pairs) (list nil nil))
    ((null? (car pairs)) nil)
    (else (cons (make pairs) (zip (map (lambda (x) (cdr x)) pairs))))
    )
  ) 

;; Problem 17
;; Returns a list of two-element lists
(define (enumerate s)
  (define (hold n lst)
    (cond
      ((null? lst) nil)
      (else (cons (cons n (cons (car lst) nil)) (hold (+ n 1) (cdr lst))))
      )
    )
  (hold 0 s)
  )
  ; END PROBLEM 17

;; Problem 18
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN PROBLEM 18
  (cond 
    ((null? denoms) nil)
    ((< total 0) nil)
    ((= total 0) (cons (cons (car denoms) nil) nil))
    ((> (car denoms) total) (list-change total (cdr denoms)))
    ((= (car denoms) total) (append (list-change (- total (car denoms)) denoms) (list-change total (cdr denoms))))
    (else (append (cons-all (car denoms) (list-change (- total (car denoms)) denoms)) (list-change total (cdr denoms))))
    )
  ) 
  ; END PROBLEM 18

;; Problem 19
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let)) 

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           (cons form (cons (map let-to-lambda params) (map let-to-lambda body)))
           ;(list form params (car body))
           ; END PROBLEM 19
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body (cddr expr)))
           ; BEGIN PROBLEM 19
            ;(cdr (zip values))
            ;values
             
            (cons (cons 'lambda (cons (car (zip (let-to-lambda values))) (let-to-lambda body))) (cadr (zip (let-to-lambda values))))
            ;(cons (cons 'lambda (cons (car (zip values)) body)) (cadr (zip values))) 
           ; END PROBLEM 19
           ))
        (else
         ; BEGIN PROBLEM 19
          (map let-to-lambda expr)
         ; END PROBLEM 19
         )))
