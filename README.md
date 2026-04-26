# gffutils

Small compatibility-focused container for `gffutils`, for creating and querying local SQLite databases from GFF/GTF annotations.

## Quick Usage

```bash
docker pull docker.io/picotainers/gffutils:latest
docker run --rm docker.io/picotainers/gffutils:latest --help
```

## Usage

```bash
# show CLI help
docker run --rm docker.io/picotainers/gffutils:latest --help

# mount current directory for local annotation/database files
docker run --rm -v "$(pwd):/data" docker.io/picotainers/gffutils:latest --help
```

## Building

```bash
docker build -t docker.io/picotainers/gffutils:latest .
```
