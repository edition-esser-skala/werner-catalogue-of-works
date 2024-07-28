# %%
"""Parse RISM entries from MARCXML."""
import pandas as pd
from pymarc import Field, parse_xml_to_array

# %%
records = parse_xml_to_array("../data/rism_entries.xml")

# %%
works = [(
    r["001"].data,  # ID
    r["240"]["a"],  # title
    r.get("730", Field(tag="730")).get("a", ""),  # other title
    r.get("650", Field(tag="650")).get("a", ""),  # genre
    r["852"]["a"],  # library
    r["852"]["c"],  # shelfmark
) for r in records]

df_works = (
    pd.DataFrame.from_records(
        works,
        columns=["rism_id", "title", "title_alt",
                 "genre", "siglum", "shelfmark"]
    )
    .sort_values(["siglum", "shelfmark"])
    .reset_index(drop=True)
)

# %%
def get_incipit(r):
    """Extract incipit data."""
    incipit_data = r.get_fields("031")
    if not incipit_data:
        return []

    return [
        (
            r["001"].data,   # RISM ID
            i.get("a", ""),  # number of work
            i.get("b", ""),  # number of movement
            i.get("c", ""),  # number of excerpt
            i.get("m", ""),  # instrument
            i.get("r", ""),  # key
            i.get("t", ""),  # text
            (f'@clef:{i.get("g", "")}\n'
             f'@keysig:{i.get("n", "")}\n'
             f'@timesig:{i.get("o", "")}\n'
             f'@data:{i.get("p", "")}')
        ) for i in incipit_data
    ]

incipits: list = sum([get_incipit(r) for r in records], [])

df_incipits = pd.DataFrame.from_records(
    incipits,
    columns=["rism_id", "work", "movement", "excerpt", "instrument", "key", "text", "pae"]
)

# %%
df_works.to_csv("../data_generated/rism_entries.csv", index=False)
df_incipits.to_csv("../data_generated/rism_incipits.csv", index=False)
