FROM boggart/s6-ubuntu-base
ENV AppName=Desktop
COPY base /
ADD https://ci.appveyor.com/api/buildjobs/u80y8ac9chnrp4dj/artifacts/easy-novnc_linux-64bit /usr/local/bin/easy-novnc
RUN \
  chmod +x /usr/local/bin/easy-novnc && \
  chmod +x /usr/local/bin/wait-for && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
  openbox \
  tigervnc-standalone-server && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists && \
  mkdir -p /usr/share/desktop-directories
