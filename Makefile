GUIXTM=guix time-machine -C ./rde/channels-lock.scm
GUILE=$(GUIXTM) -- shell -m ./rde/manifest.scm -- guile
GUILE_DEV=$(GUILE) -L ./src/guile -L ./tests/guile -L ./dev/guile

.PHONY=lock
lock: rde/channels-lock.scm

rde/channels-lock.scm: rde/channels.scm
	echo -e "(use-modules (guix channels))\n" > rde/channels-lock-tmp.scm
	guix time-machine -C rde/channels.scm -- \
	describe -f channels >> rde/channels-lock-tmp.scm
	mv rde/channels-lock-tmp.scm rde/channels-lock.scm

repl: rde/channels-lock.scm
	${GUILE_DEV} -c \
	"((@ (ares server) run-nrepl-server))"
