load("@build_bazel_rules_nodejs//:index.bzl", "nodejs_binary")
load("@io_bazel_rules_docker//nodejs:image.bzl", "nodejs_image")

nodejs_binary(
  name = "myapp",
  data = [],
  entry_point = "index.js",
  toolchain = "nodejs_host",
)

nodejs_image(
  name = "docker",
  entry_point = "index.js",
  data = ["myapp"],
  include_node_repo_args = False,
  binary = "myapp",
  node_repository_name = "nodejs_host",
)
