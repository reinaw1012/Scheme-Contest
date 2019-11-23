;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Your title here>
;;;
;;; Description:
;;;   <It's your masterpiece.
;;;    Use these three lines to describe
;;;    its inner meaning.>

(define (map fn vals) 
  (if (null? vals) 
      () 
      (cons (fn (car vals)) 
            (map fn (cdr vals)))))


(define-macro (for sym vals expr)
  (list 'map (list 'lambda (list sym) expr) vals))

(define (drawcircle radius x y)
    (penup)
    (setposition x y)
    (pendown)
    (begin_fill)
    (circle radius)
    (end_fill)
    (penup)
)

(define (range a b step)
  (if (> a b) nil (cons a (range (+ a step) b step))))

(define (get index lst)
  (if (= index 0) 
    (car lst)
    (get (- index 1) (cdr lst))
  )
)

(define colors '("red" "green" "blue" "orange" "yellow" "cyan" "black" "gray" "olive" "magenta" "pink" "purple" "indigo" "brown" "maroon" "coral" "navy"))

(define (drawcircles radius)
    (define i 0)
    (for x (range (* -1 (/ (screen_width) 2)) (/ (screen_width) 2) (* radius 2))
        (for y (range (* -1 (/ (screen_height) 2)) (/ (screen_height) 2) (* radius 2))
              (begin 
                (color (get (random 0 (length colors)) colors))
                (drawcircle radius x y)
              )
        )
    )
)

(define (draw)
  (print (random 1 20))
  (speed 10)
  (drawcircles 20)
  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)