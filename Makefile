build_dir := build
test_dir := test
data_dir := data
data_files = $(data_dir)/service_to_port.json $(data_dir)/port_to_service.json

all: build test docs

build: $(data_files)

docs:
	terraform-docs markdown table . > README.md

test: build
	@terraform -chdir=$(test_dir) apply -auto-approve

clean:
	rm -rf $(data_files)

$(data_files):
	@terraform -chdir=$(build_dir) apply -auto-approve
