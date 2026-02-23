KMYACC = ../src/kmyacc

all: streem_parser

streem.odin: streem.odiny ../src/kmyacc.odin.push.parser
	$(KMYACC) -v -m ../src/kmyacc.odin.push.parser streem.odiny

streem_parser: streem.odin ast.odin
	odin build . -out:streem_parser

test: streem_parser
	@pass=0; fail=0; \
	for f in examples/*.strm; do \
		printf "Testing $$f... "; \
		if ./streem_parser $$f; then \
			pass=$$((pass + 1)); \
		else \
			fail=$$((fail + 1)); \
		fi; \
	done; \
	echo ""; \
	echo "Results: $$pass passed, $$fail failed out of $$((pass + fail)) total"

clean:
	rm -f streem.odin streem_parser y.output

.PHONY: all test clean
