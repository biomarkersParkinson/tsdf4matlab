import os
import tsdf


path_to_metadata = "~/git/tsdf/tests/data/example_10_3_float32_meta.json"

metadata_dict = tsdf.load_metadata_from_path(path_to_metadata)


# Retrieve the metadata object we want, using the name of the binary as key
metadata = metadata_dict["example_10_3_float32_meta.bin"]

# Load the data
data = metadata.load_binary()

# Print some info
print(f"Data type used for storing:\t {data.dtype}")
print(f"Data dimensions:\t\t {data.shape}")
print(f"Number of rows:\t\t\t {data.shape[0]}")

