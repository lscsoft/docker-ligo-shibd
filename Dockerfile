FROM centos/systemd

RUN curl --silent -o /etc/yum.repos.d/security:shibboleth.repo https://download.opensuse.org/repositories/security:/shibboleth/CentOS_7/security:shibboleth.repo

RUN yum upgrade -y && \
    yum -y install httpd shibboleth && \
    yum clean all && \
    systemctl enable shibd.service && \
    systemctl enable httpd.service

COPY login.ligo.org.cert.LIGOCA.pem /etc/shibboleth/login.ligo.org.cert.LIGOCA.pem
COPY inc-md-cert.pem /etc/shibboleth/inc-md-cert.pem
COPY shibboleth-ds /etc/shibboleth-ds
