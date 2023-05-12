# Install dependencies
install:
	sudo apt-get update && \
	sudo apt-get install -y tidy
	sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
	sudo chmod +x /bin/hadolint

# Lint Dockerfile
lint-docker:
	hadolint Dockerfile

# Lint HTML
lint-html:
	tidy -q -e index.html

# Remove lint output
clean:
	rm -f hadolint.xml index.html

# Default target
all: install lint-docker lint-html clean
