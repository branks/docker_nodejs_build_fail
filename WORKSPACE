# Initialize the workspace
workspace(
  name = 'docker_nodejs_demo',
  managed_directories = {
    "@npm": ["node_modules"]
  },
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

###############################
# WORKSPACE                   #
###############################
http_archive(
    name = "bazel_skylib",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
    ],
    sha256 = "c6966ec828da198c5d9adbaa94c05e3a1c7f21bd012a0b29ba8ddbccb2c93b0d",
)
load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
bazel_skylib_workspace()

###############################
# NODEJS                      #
###############################
http_archive(
  name = "build_bazel_rules_nodejs",
  sha256 = "c077680a307eb88f3e62b0b662c2e9c6315319385bc8c637a861ffdbed8ca247",
  urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/5.1.0/rules_nodejs-5.1.0.tar.gz"],
)
load("@build_bazel_rules_nodejs//:repositories.bzl", "build_bazel_rules_nodejs_dependencies", )

build_bazel_rules_nodejs_dependencies()

load("@build_bazel_rules_nodejs//:index.bzl", "npm_install")
load("@rules_nodejs//nodejs:repositories.bzl", "nodejs_register_toolchains")

nodejs_register_toolchains(
  name = "nodejs_host",
  use_nvmrc = "//:.nvmrc",
)

npm_install(
  name = "npm",
  package_json = "//:package.json",
  package_lock_json = "//:package-lock.json",
  node_repository = "nodejs_host",
)

###############################
# DOCKER                      #
###############################
http_archive(
  name = "io_bazel_rules_docker",
  sha256 = "85ffff62a4c22a74dbd98d05da6cf40f497344b3dbf1e1ab0a37ab2a1a6ca014",
  strip_prefix = "rules_docker-0.23.0",
  urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.23.0/rules_docker-v0.23.0.tar.gz"],
)
load(
  "@io_bazel_rules_docker//repositories:repositories.bzl",
  container_repositories = "repositories",
)
container_repositories()

load(
  "@io_bazel_rules_docker//nodejs:image.bzl",
  _nodejs_image_repos = "repositories",
)

_nodejs_image_repos()
