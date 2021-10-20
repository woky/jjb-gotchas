INFILE = job-template.yml
TMPDIR = tmpjobs/
TEMPLATES = $(wildcard templates/*/template.yaml)
RESULTS = $(addsuffix result.txt, $(dir $(TEMPLATES)))

all: $(RESULTS)

$(RESULTS): templates/%/result.txt: templates/%/template.yaml
	@mkdir -p $(TMPDIR)
	@find $(TMPDIR) -mindepth 1 -delete
	jenkins-jobs -l fatal test -o $(TMPDIR) --config-xml $<
	ls $(TMPDIR) >$@

clean:
	rm $(RESULTS)
