/(load "bmi.lisp")

(defvar *option_kg* nil)
(defvar *option_cm* nil)
(defvar *kg* 0)
(defvar *cm* 0)

(defun init()
    (dolist (x sb-ext:*posix-argv*)
      (cond
        ((equal *option_kg* t)
         (setq *kg* (parse-integer x))
         (setq *option_kg* nil))
        ((equal *option_cm* t)
         (setq *cm* (parse-integer x))
         (setq *option_cm* nil))
        ((string= x "-kg")
         (setq *option_kg* t))
        ((string= x "-cm")
         (setq *option_cm* t)))))

(defun main()
  (init)
  (cond ((and (/= *kg* 0) (/= *cm* 0))
         (bmi *kg* *cm*))
        ((or (= *kg* 0) (= *cm* 0))
         (format t "このアプリはBMI計算機です。~%-kg 46 -cm 153 といった感じにコマンドライン引数として体重と身長（センチメートル）を渡してください。~%"))))

(main)
