TXTDIR = yazi

all: update push

clean:
	rm index.html
	rm $(TXTDIR}/index.html

update:
	$(SHELL) generate.sh

push:
	git add .
	git commit -m "Generic update"
	git push
