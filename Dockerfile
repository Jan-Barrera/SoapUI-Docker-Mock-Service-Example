#Use alpine jdk 13
FROM openjdk:13-jdk-alpine

# Set soapui version environment variable
ENV SOAPUI_VERSION 5.6.0

# Download SoapUI package
RUN wget  https://s3.amazonaws.com/downloads.eviware/soapuios/${SOAPUI_VERSION}/SoapUI-${SOAPUI_VERSION}-linux-bin.tar.gz

# Unzip SoapUI to /usr/local
RUN gunzip -c SoapUI-${SOAPUI_VERSION}-linux-bin.tar.gz | tar -xf - -C /usr/local

# Create symbolic link
RUN ln -s /usr/local/SoapUI-${SOAPUI_VERSION} /usr/local/SoapUI

# Set environment path
ENV PATH ${PATH}:/usr/local/SoapUI/bin

# Open application port
EXPOSE 8080

# Copy project xml
COPY ./Mock-Service-soapui-project.xml /

# Copy entry point script
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# Set working directory
WORKDIR /

# Set entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]