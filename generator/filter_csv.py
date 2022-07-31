import re
import pandas as pd
from alive_progress import alive_bar

# create data file
print("Creating database pl file.")
file = open("./src/data/database.pl", "w")
print("Database file created!")

# read csv with music data
print("Loading csv data file.")
df = pd.read_csv("./generator/data.csv")
print("Csv data file loaded!")

# separate musics dataframe by genders
df.sort_values("popularity")

genres = ["Movie", "R&B", "A Capella", "Alternative", "Country", "Dance",
          "Electronic", "Anime", "Folk", "Blues", "Opera", "Hip-Hop",
          "Children", "Rap", "Indie","Classical", "Pop", "Reggae", "Reggaeton", 
          "Jazz", "Rock", "Ska","Comedy", "Soul", "Soundtrack", "World"]

# mount genres database
with alive_bar(len(genres), title="Creating genres database.") as bar:
    for genre in genres:
        file.write(f"genre('{genre}').\n")
        bar()
        
file.write("\n")

# mount musics database
artists = list()
with alive_bar(len(genres), title="Creating musics database.") as bar:
    for genre in genres:
        genre_df = df[df["genre"] == genre]
        genre_musics = genre_df.head(100)
        for _, music in genre_musics.iterrows():
            music_dict = dict(
                genre=genre,
                artist_name=re.sub(r"[^\w\s]", "", music.get("artist_name")),
                track_name=re.sub(r"[^\w\s]", "", music.get("track_name")),
                popularity=music.get("popularity"),
                danceability=music.get("danceability"),
                duration_ms=music.get("duration_ms")
            )
            artists.append(music_dict.get("artist_name"))
            file.write(f"music('{genre}', '{music_dict.get('artist_name')}', '{music_dict.get('track_name')}', {float(music_dict.get('popularity'))}, {float(music_dict.get('danceability'))}, {float(music_dict.get('duration_ms'))}).\n")
        bar()
        
file.write("\n")

# mount artists database
artists = set(artists)
with alive_bar(len(artists), title="Creating artists database.") as bar:
    for artist in artists:
        file.write(f"artist('{artist}').\n")
        bar()

# close and save file
file.close()