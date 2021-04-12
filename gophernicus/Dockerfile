FROM alpine as xinetd-builder
RUN apk add --update build-base git linux-headers bsd-compat-headers
RUN wget https://downloads.sourceforge.net/project/libtirpc/libtirpc/1.2.6/libtirpc-1.2.6.tar.bz2 && \
   tar xvjf libtirpc*.tar.bz2 && \
   cd libtirpc* && \
   ./configure --enable-static --disable-gssapi && \
   make && \
   make install && \
   cd .. 
RUN git clone https://github.com/xinetd-org/xinetd && \
   cd xinetd && \
   CFLAGS="-s -I/usr/include/tirpc" CPPFLAGS="-DHAVE_RLIM_T" ./configure && \
   LDFLAGS="-Wl,-Bstatic -ltirpc -Wl,-Bdynamic" make && \
   make install && \
   cd ..

FROM alpine as gophernicus-builder
RUN apk add --update --no-cache git build-base && \
   git clone https://github.com/gophernicus/gophernicus && \
   cd gophernicus && \
   ./configure --listener=xinetd && \
   make && \
   make install


FROM alpine
LABEL maintainer="wfnintr <wfnintr@null.net>"
RUN mkdir /etc/xinetd.d /var/gopher && \
   echo "includedir /etc/xinetd.d" > /etc/xinetd.conf
COPY --from=xinetd-builder /usr/local/sbin/xinetd /usr/local/bin/
COPY --from=gophernicus-builder /usr/local/sbin/gophernicus /usr/local/sbin/
COPY --from=gophernicus-builder /etc/xinetd.d/gophernicus /etc/xinetd.d/gophernicus
ENTRYPOINT ["xinetd"]
CMD ["-dontfork"]
