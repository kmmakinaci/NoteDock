docker build -t linux-notebook .
docker run -it --rm -v $(pwd)/notebook:/notebook linux-notebook
