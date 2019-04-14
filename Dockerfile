FROM ubuntu:18.04

# the URL can be obtained from a stable URL:
# curl -w "%{url_effective}\n" -I -L -s -S 'https://go.microsoft.com/fwlink/?LinkID=760868' -o /dev/null
ENV VSCODE_URL=https://az764295.vo.msecnd.net/stable/51b0b28134d51361cf996d2f0a1c698247aeabd8/code_1.33.1-1554971066_amd64.deb

RUN apt-get update && \
  apt-get install -y --no-install-recommends ca-certificates curl && \
  curl -LO ${VSCODE_URL} && \
  apt-get install -y --no-install-recommends ./code_*.deb \
  libasound2 libx11-xcb1 libxtst6 git && \
  rm -f ./code_*.deb && \
  rm -rf /var/lib/apt/lists/*

COPY vscode-install.sh /usr/local/bin/vscode-install.sh

ENTRYPOINT ["/usr/local/bin/vscode-install.sh"]
