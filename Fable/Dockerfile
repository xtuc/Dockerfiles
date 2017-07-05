FROM microsoft/dotnet

ENV APP_HOME /root
ENV MONO_VERSION 5.0.1.1

WORKDIR $APP_HOME

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb http://download.mono-project.com/repo/debian jessie/snapshots/$MONO_VERSION main" > /etc/apt/sources.list.d/mono-official.list \
  && apt-get update \
  && apt-get install -y binutils mono-devel ca-certificates-mono fsharp mono-vbnc nuget referenceassemblies-pcl sudo \
  && rm -rf /var/lib/apt/lists/* /tmp/*

# Install nodejs and npm
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs

CMD ["bash"]
