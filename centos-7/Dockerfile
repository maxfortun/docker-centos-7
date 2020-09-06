FROM centos:7

COPY fs /

RUN /tmp/update_base.sh || exit $?

VOLUME [ "/sys/fs/cgroup" ]

CMD /usr/sbin/init

