FROM ubuntu:14.04

LABEL MAINTAINER="Aji Rama Wangsa <ajiavt@gmail.com>"

# Copy local iReport zip file
COPY iReport-5.6.0.zip /iReport-5.6.0.zip

RUN apt-get update \
	&& apt-get install -y openjdk-7-jdk libxrender1 libxtst6 libxi6 unzip \
	&& apt-get install -y xfonts-base xfonts-75dpi xfonts-100dpi \
	&& apt-get install -y libxext6 libxss1 libgconf-2-4 \
	&& unzip iReport-5.6.0.zip \
	&& chmod +x /iReport-5.6.0/bin/ireport \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /iReport-5.6.0.zip

ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64

# Set Java system properties to fix display issues
ENV _JAVA_OPTIONS="-Djava.awt.headless=false -Dswing.defaultlaf=javax.swing.plaf.metal.MetalLookAndFeel -Dswing.crossplatformlaf=javax.swing.plaf.metal.MetalLookAndFeel -Dsun.java2d.xrender=false -Dsun.java2d.pmoffscreen=false -Dsun.java2d.d3d=false -Dsun.java2d.opengl=false -Dswing.volatileImageBufferEnabled=false -Djava.awt.useSystemAAFontSettings=on -Dswing.aatext=true -Dsun.java2d.noddraw=true -Dsun.java2d.ddforcevram=false"

CMD [ "/iReport-5.6.0/bin/ireport" ]
