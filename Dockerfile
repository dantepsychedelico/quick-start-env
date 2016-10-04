FROM centos:7

MAINTAINER Zac Chung

RUN yum install -y ssh vim git ssh-server epel-release

RUN useradd -m zac

RUN unlink /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Taipei /etc/localtime

RUN ssh-keygen -A

ADD .vimrc /home/zac

RUN chown zac:zac -R /home/zac
RUN chmod 700 /home/zac/.ssh

USER zac

WORKDIR /home/zac

RUN vim -c 'PluginInstall' -c 'qa'

#RUN ssh-keyscan bitbucket.org >> ~/.ssh/known_hosts

#RUN npm install

CMD ['/usr/sbin/sshd', '-D']
