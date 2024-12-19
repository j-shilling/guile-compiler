(use-modules (guix packages)
             (gnu packages guile)
             (gnu packages guile-xyz))

(packages->manifest
 (list
  guile-next
  guile-ares-rs
  guile-readline
  guile-colorized
  guile-quickcheck))
