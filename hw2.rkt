#lang racket
(define (bwt str)
  ;; Step 1
  (define (rotate s i)
    (string-append (substring s i) (substring s 0 i))
    )
  (define li
    (for/list ([i (in-range (string-length str))])
      (rotate str i)
      )
    )
  (display "Rotations: ")
  (display li)
  (newline)
  ;; Step 2
  (define sorted_li (sort li string<?))
  (display "Sorted: ")
  (display sorted_li)
  (newline)
  ;; Step 3
  (define last_chars
    (for/list ([i (in-range (string-length str))])
      (substring (list-ref sorted_li i) (- (string-length str) 1)))
  )
  (display "Last Chars: ")
  (display last_chars)
  (newline)
  ;; Step 4
  (define con_last_chars
      (apply string-append last_chars))
  (display "Concatenated Last Chars: ")
  (display con_last_chars)
  (newline)
  ;; Step 5
  ;; Not shown in the output sample but present in the assignment so I assume it's necessary
  (display "Largest String: ")
  (display (list-ref sorted_li (- (string-length str) 1)))
  (newline)
  ;; Step 6
  (display "Concatenated Smallest and Largest Strings: ")
  (define smallbig_str
    (string-append (list-ref sorted_li 0) (list-ref sorted_li (- (string-length str) 1))))
  (display smallbig_str)
  (newline)
)