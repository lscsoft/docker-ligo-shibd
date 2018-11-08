FROM centos/systemd

RUN curl -o /etc/yum.repos.d/security:shibboleth.repo  http://download.opensuse.org/repositories/security:/shibboleth/CentOS_7/security:shibboleth.repo

RUN yum upgrade -y && \
    yum -y install shibboleth && \
    yum clean all && \
    systemctl enable shibd.service

COPY login.ligo.org.cert.LIGOCA.pem /etc/shibboleth/login.ligo.org.cert.LIGOCA.pem

VOLUME /var/run/shibboleth
