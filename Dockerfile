# Stage 1: Build the 2FA email authenticator plugin
FROM maven:3.9-eclipse-temurin-21 AS plugin-builder

WORKDIR /build
RUN git clone https://github.com/mesutpiskin/keycloak-2fa-email-authenticator.git .
RUN mvn clean package -DskipTests

# Stage 2: Build Keycloak with the plugin
FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION:-26.5.2} AS builder

COPY --from=plugin-builder /build/target/keycloak-2fa-email-authenticator-*.jar /opt/keycloak/providers/
RUN /opt/keycloak/bin/kc.sh build

# Stage 3: Final image
FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION:-26.5.2}

COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
