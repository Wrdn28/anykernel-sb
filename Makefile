NAME ?= StormBreaker

DATE := $(shell date "+%Y%m%d-%H%M")

DEVICE := ginkgo

KERNELVERSION := $(shell cat ../Makefile | grep VERSION | head -n 1 | sed "s|.*=||1" | sed "s| ||g")

KERNELPATCHLEVEL := $(shell cat ../Makefile | grep PATCHLEVEL | head -n 1 | sed "s|.*=||1" | sed "s| ||g")

VERSION := 0.4

ZIP := $(NAME)-$(DEVICE)-beta-$(DATE)-$(VERSION).zip

EXCLUDE := Makefile *.git* *.jar* *placeholder* *.md*

normal: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."


clean:
	@rm -vf dtbo.img
	@rm -vf *.zip*
	@rm -vf zImage
	@rm -vf Image*
	@echo "Cleaned Up."
