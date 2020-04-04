FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.4.3

USER root
RUN echo 'path.repo: ["/usr/share/elasticsearch/data/backup"]' >> /usr/share/elasticsearch/config/elasticsearch.yml
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin list | grep -q analysis-kuromoji || /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-kuromoji
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin list | grep -q analysis-icu || /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin list | grep -q repository-s3 || /usr/share/elasticsearch/bin/elasticsearch-plugin install repository-s3 --batch
