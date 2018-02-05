(load "bmi-calc.lisp")

(sb-ext:save-lisp-and-die "bmi-calc"
                          :toplevel #'main
                          :executable t)
