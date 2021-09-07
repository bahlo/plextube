# plextube

A dead-simple YouTube downloader, meant for Plex.

## Get started
Create a text file called `subs.txt` and fill it with YouTube channels or playlists.

Then run the docker container like this:
```sh
docker run -v subs.txt:/opt/plextube/subs.txt -v videos:/opt/plextube/videos ghcr.io/bahlo/plextube 
```

plextube will automatically download the last two weeks of videos and delete the ones that are older.
