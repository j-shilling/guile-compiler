;;; Commentary:

;;; Code:

(define-module (syntax)
  #:use-module (srfi srfi-9)
  #:export
  (<int>
   int
   int?
   int-value

   <prim>
   prim
   prim?
   prim-op
   prim-args

   <var>
   var
   var?
   var-name

   <let>
   binding
   binding?
   binding-var
   binding-exp
   binding-value

   <program>
   program?
   program-exp
   program-info))

(define-record-type <int>
  (int value)
  int?
  (value int-value))

(define-record-type <prim>
  (prim op args)
  prim?
  (op prim-op)
  (args prim-args))

(define-record-type <var>
  (var name)
  var?
  (name var-name))

(define-record-type <let>
  (binding var value exp)
  binding?
  (var binding-var)
  (value binding-value)
  (exp binding-exp))

(define-record-type <program>
  (program info exp)
  program?
  (info program-info)
  (exp program-exp))

;;; syntax.scm ends here
