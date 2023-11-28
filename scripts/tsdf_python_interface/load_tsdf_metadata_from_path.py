"""
Module for saving the metadata and the binary files from a data objects.

input: 
path_to_metadata - a string containing the path to the metadata file.

return: 
Return_list_data - a list of data objects loaded from the binary files described in the metadata.
Return_list_metadata - a list of metadata objects read from the metadata file.
Success - boolean value indicating if the data was loaded correctly.

"""

import os
import numpy as np
import json
import tsdf as tsdf


Success:bool = False

# path_to_metadata = "/Users/vedran/git/biomarkers_repo/tsdf4matlab/data/ppp_format_meta_legacy.json"

# Load the metadata
with open(path_to_metadata, "r") as file:
    metadata_dict = tsdf.load_metadata_file(file)

# List of metadata objects read from the metadata file
Return_list_metadata:list = []

# List of data objects loaded from the binary files
Return_list_data:list = []

# Load the data from each binary file described in the metadata
for metadata_dict_key in metadata_dict.keys():
    metadata = metadata_dict[metadata_dict_key]
    # Save the metadata
    Return_list_metadata.append(json.dumps(metadata.get_plain_tsdf_dict_copy()))
    # Save the data
    data = tsdf.load_binary_from_metadata(metadata)
    Return_list_data.append(data)

Success = True

print(len(Return_list_metadata))