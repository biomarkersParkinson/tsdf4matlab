"""
Module for saving the metadata and the binary files from a data objects.

input: 
py_list_metadata - list of the metadata objects describing each binary file
py_list_data - list of time series data (each element representing a content of a binary file)
py_dir_path - path to the dir where the data should be saved
py_metadata_file_name - name of the metadata file

return: 
Success - boolean value indicating if the data was loaded correctly.

"""

import os
import numpy as np
import json
import tsdf as tsdf
from typing import List


Success:bool = False

py_list_metadata:List[any] = []
py_list_data: List[np.ndarray] = []
py_dir_path: str = ""
py_metadata_file_name: str = ""

py_updated_list_metadata:List[any] = []

for metadata, data in zip(py_list_metadata, py_list_data):
    file_name = metadata['file_name']
    new_metadata = tsdf.write_binary_file(py_dir_path, file_name, data, metadata)
    py_updated_list_metadata.append(new_metadata)


tsdf.write_metadata(py_updated_list_metadata, py_metadata_file_name)

Success = True
