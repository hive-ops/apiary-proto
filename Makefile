
setup:
	brew install bufbuild/buf/buf
	brew install clang-format

format-proto:
	find ./apiary -name "*.proto" -exec clang-format -i {} +

buf-lint: format-proto
	buf lint

buf-breaking:
	buf breaking --against '.git#branch=main'

buf-generate: buf-lint buf-breaking
	rm -rf gen
	buf generate
