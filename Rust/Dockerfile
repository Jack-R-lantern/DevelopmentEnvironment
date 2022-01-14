FROM alpine:3.14

RUN apk add --no-cache \
        ca-certificates \
        gcc

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=$PATH:/usr/local/cargo/bin \
    RUST_VERSION=1.57.0

RUN set -eux; \
    apkArch="$(apk --print-arch)"; \
    case "$apkArch" in \
        x86_64) rustArch='x86_64-unknown-linux-musl'; rustupSha256='bdf022eb7cba403d0285bb62cbc47211f610caec24589a72af70e1e900663be9' ;; \
        aarch64) rustArch='aarch64-unknown-linux-musl'; rustupSha256='89ce657fe41e83186f5a6cdca4e0fd40edab4fd41b0f9161ac6241d49fbdbbbe' ;; \
        *) echo >&2 "unsupported architecture: $apkArch"; exit 1 ;; \
    esac; \
    url="https://static.rust-lang.org/rustup/archive/1.24.3/${rustArch}/rustup-init"; \
    wget "$url"; \
    echo "${rustupSha256} *rustup-init" | sha256sum -c -; \
    chmod +x rustup-init; \
    ./rustup-init -y --no-modify-path --profile minimal --default-toolchain $RUST_VERSION --default-host ${rustArch}; \
    rm rustup-init; \
    chmod -R a+w $RUSTUP_HOME $CARGO_HOME; \
    rustup --version; \
    cargo --version; \
    rustc --version;

# SSH
RUN set -x \
&& apk add --no-cache \
  openssh \
&& sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' -i /etc/ssh/sshd_config \
&& echo 'root:root' | chpasswd \
&& ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa \
&& ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa \
&& mkdir -p /var/run/sshd

RUN echo "export PATH=$PATH" >> /etc/profile.d/mysetting.sh \
&& echo "export RUSTUP_HOME=$RUSTUP_HOME" >> /etc/profile.d/mysetting.sh \
&& echo "export CARGO_HOME=$CARGO_HOME" >> /etc/profile.d/mysetting.sh \
&& echo "export RUST_VERSION=$RUST_VERSION" >> /etc/profile.d/mysetting.sh \

# rsync
RUN set -x \
&& apk add --no-cache rsync

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
