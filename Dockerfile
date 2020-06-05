FROM python:3.8 as builder
RUN pip install sphinx -i https://mirrors.aliyun.com/pypi/simple/
COPY source source
RUN sphinx-build  source  build/html/

FROM nginx:latest
COPY --from=builder build/html /usr/share/nginx/html
EXPOSE 80
