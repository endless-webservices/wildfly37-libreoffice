FROM quay.io/wildfly/wildfly:37.0.1.Final-jdk21

USER root

RUN microdnf -y install wget tar gzip fontconfig libXinerama cups-libs dbus-glib cairo nss \
    nspr \
    cairo \
    cups-libs \
    dbus-glib \
    fontconfig \
    libX11 \
    libXext \
    libXinerama \
    libXrender \
    libSM \
    libICE \
    libxslt \
    libX11-xcb \
    libXcomposite \
    libXcursor \
    libXdamage \
    libXfixes \
    libXi \
    libXrandr \
    libXtst \
    libxcb \
    mesa-libGL \
    mesa-libgbm \
    at-spi2-core \
    atk \
    gtk3 \ 
    && microdnf clean all

# LibreOffice RPM-Archiv herunterladen und installieren (Versionsnummer ggf. anpassen)
RUN wget -q https://download.documentfoundation.org/libreoffice/stable/26.8.3/rpm/x86_64/LibreOffice_26.8.3_Linux_x86-64_rpm.tar.gz && \
    tar -xzf LibreOffice_*_Linux_x86-64_rpm.tar.gz && \
    rpm -Uvh ./LibreOffice_*_Linux_x86-64_rpm/RPMS/*.rpm && \
    rm -rf LibreOffice_* && ln -s /bin/libreoffice26.8 /bin/soffice

USER jboss
