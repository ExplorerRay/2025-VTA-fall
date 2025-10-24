group "default" {
  targets = ["client", "server"]
}

target "client" {
  context = "./client"
  tags = ["client-314552013:latest"]
}

target "server" {
  context = "./server"
  tags = ["server-314552013:latest"]
}
