FROM centos:5

LABEL "maintainer"="Michael BD7MQB <bd7mqb@qq.com>" \
    "version"="5.11" \
    "description"="CentOS 5.11 (yum repo set to http://archive.kernel.org/centos-vault/5.11/)"

RUN sed -i -e 's/^#baseurl=/baseurl=/' \
    -e 's/^mirrorlist=/#mirrorlist=/' \
    -e 's!http://mirror.centos.org/centos/$releasever/!http://archive.kernel.org/centos-vault/5.11/!' \
    /etc/yum.repos.d/*.repo && \
    sed -i -e 's/enabled=1/enabled=0/' \
    /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/libselinux.repo /etc/yum/pluginconf.d/fastestmirror.conf && \
    yum -y clean all

RUN yum update -y