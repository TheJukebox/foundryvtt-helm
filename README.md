# foundryvtt-helm
A Helm chart for deploying [FoundryVTT](https://foundryvtt.com/) to Kubernetes.

## Packaging the Helm Chart

You can package the Helm chart locally from this repository:

```bash
helm package charts/foundryvtt
```

With the chart built, you can install it to your Kubernetes cluster with the resulting tarball:

```bash
helm install -n foundryvtt foundryvtt ./foundryvtt-0.0.1.tgz
```

## Building the FoundryVTT Container Image

To build the FoundryVTT image used with this chart, you first need to download a zipped release of FoundryVTT. Once you have a release, place it alongside the Dockerfile in this repository and build the container with Docker or other container management tools:

```bash
docker build . -t foundryvtt:12.325
# Now you can run the container to test
docker run foundryvtt:12.325
```

To build with other versions or change the FoundryVTT data path, you can use build args:

```bash
export FOUNDRY_VERSION=12.325
export FOUNDRY_DATA=/foundrydata
docker build . -t foundryvtt:$FOUNDRY_VERSION \
    --build-arg="FOUNDRY_VERSION=${FOUNDRY_VERSION}" \
    --build-arg="FOUNDRY_DATA=${FOUNDRY_DATA}"
```

To make your data persistent, use a volume:

```bash
docker run -v ./foundry-data:/foundrydata foundryvtt:12.325
```
