group "default" {
  targets = ["build"]
}

target "build" {
    dockerfile = "../../Dockerfile"
    context = "./pfc-firmware-sdk-g2/ptxproj"
    target = "build"
    output = ["out"]
}