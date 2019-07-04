Installs and runs an Opentripplanner instance for Berlin and Brandenburg

1. Build graph with `make build` (takes ~30 minutes)
1. Run instance with `make run` (takes ~5 minutes to start)

## Docker container

Since OTP requires Java 8 and does _not_ run under Java 9 and up, there is 
a Docker container which you can build.

In order to use it run:

1. `make docker-build`
1. `make docker-run`
1. Open [http://localhost:8080](http://localhost:8080)
