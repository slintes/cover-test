#!/usr/bin/env bash

OUTDIR=_output/coverage
COVER_FILE="${OUTDIR}/cover.out"
FUNC_FILE="${OUTDIR}/coverage.txt"
HTML_FILE="${OUTDIR}/coverage.html"

mkdir -p "$OUTDIR"

go test -race -covermode=atomic -coverprofile="${COVER_FILE}" ./pkg/...
go tool cover -func="${COVER_FILE}" > "${FUNC_FILE}"
go tool cover -html="${COVER_FILE}" -o "${HTML_FILE}"
