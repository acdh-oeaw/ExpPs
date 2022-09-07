FROM basex/basexhttp:9.5.2
RUN git clone https://github.com/acdh-oeaw/ExpPs.git ExpPs
COPY /ExpPs/api/psalmcatenae-server /srv/basex/webapp
CMD ["/bin/basex","CREATE DB psalmcatenae-manuscripts /ExpPs/xml/vat-gr-754/vat-gr-754-transcription.xml"]
CMD ["/usr/local/bin/basexhttp"]