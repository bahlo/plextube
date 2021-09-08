# plextube [![CI](https://github.com/bahlo/plextube/actions/workflows/ci.yml/badge.svg)](https://github.com/bahlo/plextube/actions/workflows/ci.yml)

A dead-simple YouTube downloader, meant for Plex.

## Get started
Create a text file called `subs.txt` and fill it with YouTube channels or playlists.

Then run the docker container like this:
```
docker run \ 
  -v archive:/opt/plextube/archive \
  -v subs.txt:/opt/plextube/subs.txt \
  -v videos:/opt/plextube/videos \
  ghcr.io/bahlo/plextube 
```

plextube will automatically download the last two weeks of videos and delete the ones that are older.

In Plex, create a library of the type `Other Videos`. Go to Settings → Agents and make sure `Local Media Assets` is the topmost agent for Movies → Personal Media.
