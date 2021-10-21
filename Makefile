INFILE = job-template.yml
TMPDIR = tmpjobs/
TEMPLATES = $(wildcard templates/*/template.yaml)
RESULTS = $(addsuffix result.txt, $(dir $(TEMPLATES)))
JJB = ~/src/cpc_jenkins/.venv/bin/jenkins-jobs

all: README.md

$(RESULTS): templates/%/result.txt: templates/%/template.yaml
	@mkdir -p $(TMPDIR)
	@find $(TMPDIR) -mindepth 1 -delete
	$(JJB) -l fatal test -o $(TMPDIR) --config-xml $<
	@ls $(TMPDIR) >$@
	cat $@

README.md: $(RESULTS) mkreadme
	./mkreadme >$@


clean:
	rm $(RESULTS)
