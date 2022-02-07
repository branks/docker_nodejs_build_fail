load("@build_bazel_rules_nodejs//:index.bzl", "nodejs_binary")
load("@io_bazel_rules_docker//nodejs:image.bzl", "nodejs_image")

def nodejs_docker_js(name, entry_point, deps = []):
  nodejs_binary(
    name = name,
    data = deps,
    entry_point = entry_point,
  )

  nodejs_image(
    name = "docker",
    entry_point = entry_point,
    data = deps + [name],
    include_node_repo_args = False,
    binary = name,
  )
