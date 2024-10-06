FROM golang:1.20-alpine AS build

WORKDIR /app

COPY main.go .

RUN CGO_ENABLED=0 go build -o full_cycle_rocks main.go

FROM scratch

COPY --from=build /app/full_cycle_rocks /full_cycle_rocks

ENTRYPOINT ["/full_cycle_rocks"]