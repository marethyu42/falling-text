                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                      hello                                                                                                          
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
                                                                                                                                                                                     
;;multiple hearts works! below code does it
(initialize-hearts)

(list-timers)

(setq heart (move-down heart))
(defun set-heart (val)
  (setq hearts (move-down val)))

(setq heart (make-heart (1+ 531)))

;; REFRESH
(mapcar #'delete-overlay (overlays-in 0 100000))


(defun initialize-hearts () ;eventually how many hearts
  (setq hearts (append (make-heart (1+ 358)) (make-heart (1+ 64))))
  (setq timer-moving (run-at-time 5 1 #'set-heart hearts))) ;; works!



(defun make-heart (pos &optional lst chr)
  (default chr "♥")
  (let ((over-lay (make-overlay pos pos)))
    (overlay-put over-lay 'after-string chr)
    (list over-lay)))

(make-heart 68)

(defun move-down (over &optional offset save)
  (default offset (1+ (line-length (1+ (what-my-line (overlay-end (car over)))))))
  (cond
   ((not over) save) 
   (t (move-overlay (car over) (+ offset (overlay-end (car over))) (+ offset (overlay-end (car over))))
      (move-down (cdr over) offset (append save (list (car over)))))))
;; note: only works with saving the first/last item

;; SORTA ACTUALLY WORKS! intialize with first bit of code, then keep running second :D
;; test with multiple, then write letter for her
;;note moves down off of the len of line below, maybe should move down because of its own line? doesnt matter when it's all filled

(setq hearts (mapcar #'(lambda ( ) (make-heart  )) (list (random 910) (random 910) (random 910) (random 910))));;idk what about this breaks but smthn so just hardcode ig
;;todos:
;; randomly choose columns
;; run code every time interval
;; replace   with invis thing
;; write letter

(defmacro default (sym val)
  `(if (not ,sym) (setq ,sym ,val)))
		  
(defun line-length (n)
  "Length of the Nth line."
  (save-excursion
    (goto-char (point-min))
    (if (zerop (forward-line (1- n)))
        (- (line-end-position)
           (line-beginning-position)))))

(defun what-my-line (char &optional pos val)
  (default pos 1)
  (default val 0)
  (cond
   ((> (+ val (line-length pos)) char) pos)
   (t (what-my-line char (1+ pos) (+ val (line-length pos))))))

(what-my-line 1313)
  


(overlay-properties (car (overlays-in 2320 2691)))



(setq x 204)
(setq over-test (make-overlay 134 134))
(overlay-put over-test 'after-string "a")
(move-overlay over-test (+ x 300) (+ x 300))
