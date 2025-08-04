# CI/CD – Node.js & Docker

**One‑file GitHub Actions + Docker Hub setup.**

Every push to `main` runs tests, then (only if they pass) builds a Docker image and pushes it to Docker Hub as `latest`.

---

## 🚀 Quick Start

1. Create a **public or private repo** with your Node.js app and a `Dockerfile`.
2. In GitHub repo **Settings → Secrets**, add:
   - `DOCKERHUB_USERNAME` — your Docker ID  
   - `DOCKERHUB_REPO` — the **Repo name** in Docker Hub (not full path), e.g. `my-node-app`  
   - `DOCKERHUB_TOKEN` — Docker Hub **Access Token**
3. Make sure `.github/workflows/main.yml` (see below) is committed.
4. Push to `main`.  
   The workflow will:
   - run `npm ci && npm test` → **fail early if tests break**,  
   - then `docker login` → `docker build` → `docker push $DOCKERHUB_USERNAME/$DOCKERHUB_REPO:latest`.

If it succeeds, check your Docker Hub repo — you’ll see the updated image ✅
