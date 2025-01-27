cmds := $(wildcard tarp/*.go)
dpipes := $(wildcard dpipes/*.go)

bin/tarp:
	cd tarp && make tarp

bin/tarp_static:
	cd tarp && make tarp_static

bin/tarp-full:
	cd tarp && make tarp-full

clean:
	cd dpipes && go clean || true
	cd tarp && go clean || true

install:
	cd tarp && make install

test:
	cd dpipes && go test -v

dtest:
	cd dpipes && debug=stdout go test -v | tee ../test.log

coverage:
	cd dpipes && go test -coverprofile=c.out
	cd dpipes && go tool cover -html=c.out -o coverage.html
	firefox dpipes/coverage.html
