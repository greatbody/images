FROM --platform=linux/amd64 docker:25.0.0-git

RUN apk --no-cache add curl python3 \
    && curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-461.0.0-linux-x86_64.tar.gz \
    && tar -xf google-cloud-cli-461.0.0-linux-x86_64.tar.gz \
    && ./google-cloud-sdk/install.sh --quiet \
    && ./google-cloud-sdk/bin/gcloud --quiet components install kubectl \
    && ln -s /google-cloud-sdk/bin/gcloud /usr/sbin/gcloud \
    && ln -s /google-cloud-sdk/bin/kubectl /usr/sbin/kubectl
