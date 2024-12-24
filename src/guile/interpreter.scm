;;; Commentary:

;;; Code:

(define-module (interpreter)
  #:use-module (syntax)
  #:use-module (ice-9 match))

(define* (interpret-prim op args #:optional (env '()))
  (match
      ((_ (error "unrecognized primitive operation ~a" op)))))

(define* (interpret-exp exp #:optional (env '()))
  (match exp
    (($ <int> value) value)
    (($ <var> name) (let ((e (assoc-ref env name)))
                      (if e
                          (interpret-exp e)
                          (error "unbound variable ~a" name))))
    (($ <let> var value exp) (interpret-exp exp `((,var . ,value)
                                                  ,@env)))
    (($ <prim> op args) (interpret-prim op args env))
    (_ (error "not an expression ~a" exp))))

;;; interpreter.scm ends here
