# Not using openjdk:11-jre-bullseye since we to install openjre-11-jdk anyways for GUI libraries
FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install --yes --no-install-recommends openjdk-11-jre && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /imperishable-dawn/
ADD "http://courses.missouristate.edu/KenVollmar/mars/MARS_4_5_Aug2014/Mars4_5.jar" mars.jar
COPY game.asm .

CMD ["java", "-jar", "mars.jar"]
