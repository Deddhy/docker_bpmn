FROM ubuntu:latest 

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y
RUN apt upgrade -y
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:apt-fast/stable -y 
RUN apt update -y
RUN apt install apt-fast -y
RUN apt-fast install -yqq --no-install-recommends 
RUN apt-fast install git -y
RUN apt-fast install unzip -y
WORKDIR /root/
RUN apt-fast install curl -y
RUN apt-cache search openjdk | grep 17
RUN apt-fast install openjdk-17-jdk -y
RUN apt-fast install -qqy x11-apps
RUN apt-fast install maven -y
RUN apt-fast install x11-xserver-utils -y
RUN apt-fast install mesa-utils -y
RUN apt-fast install libgl1-mesa-glx -y 
RUN apt-fast install libgl1-mesa-dri -y
RUN apt-fast install libgl1-mesa-dev -y
RUN apt-fast install libgtk-3-0 -y
RUN apt-fast install libxext6 -y
RUN apt-fast install libxrender1 -y
RUN apt-fast install libxtst6 -y
RUN apt-fast install libxi6 -y
RUN apt-fast install net-tools -y
RUN apt-fast install mesa-common-dev libgl1-mesa-dev libglu1-mesa-dev -y
RUN apt update -y 
RUN apt upgrade -y
RUN export XAUTHORITY=~/.Xauthority

ENV DISPLAY host.docker.internal:0

RUN useradd -ms /bin/bash admin
RUN adduser admin sudo
USER admin
WORKDIR /home/admin
RUN git clone https://github.com/Gasu16/Bpmn.git
RUN git clone https://github.com/Gasu16/CleanMaven.git
RUN mkdir OpenJFX
WORKDIR OpenJFX/
RUN curl https://download2.gluonhq.com/openjfx/17.0.0.1/openjfx-17.0.0.1_linux-x64_bin-sdk.zip -o openjfx-17.0.0.1.zip
RUN unzip openjfx-17.0.0.1.zip
WORKDIR /home/admin/Bpmn/

CMD java --module-path ~/OpenJFX/javafx-sdk-17.0.0.1/lib --add-modules=javafx.controls,javafx.fxml -jar target/Translator-1.0-SNAPSHOT-jar-with-dependencies.jar


