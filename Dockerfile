# Usa una imagen base de Java
FROM openjdk:11-jdk-slim

# Instala wget para descargar Byteman
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

# Establece las variables de entorno para Byteman
ENV BYTEMAN_VERSION=4.0.23
ENV BYTEMAN_HOME=/opt/byteman

# Descarga e instala Byteman
RUN wget https://downloads.jboss.org/byteman/${BYTEMAN_VERSION}/byteman-download-${BYTEMAN_VERSION}-bin.zip -O byteman.zip && \
    unzip byteman.zip -d /opt

RUN mv /opt/byteman-download-${BYTEMAN_VERSION} ${BYTEMAN_HOME} && \
    rm byteman.zip

# Copia los archivos de la aplicación
COPY OrderService.java Main.java /app/src/com/example/
COPY order-rules.btm /app/

# Compila la aplicación
RUN javac /app/src/com/example/*.java

# Establece el directorio de trabajo
WORKDIR /app

# Comando para ejecutar la aplicación con Byteman
CMD ["java", "-javaagent:/opt/byteman/lib/byteman.jar=script:order-rules.btm", "-cp", "src", "com.example.Main"]