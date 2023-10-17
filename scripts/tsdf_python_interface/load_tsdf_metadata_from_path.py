import os
import numpy as np
import json
import tsdf as tsdf

def save_metadata_and_binary_files(path_to_metadata):
    """
    Module for saving the metadata and the binary files from a data objects.

    Parameters
    ----------
    path_to_metadata : str
        A string containing the path to the metadata file.

    Returns
    -------
    tuple
        Return_list_data : list
            A list of data objects loaded from the binary files described in the metadata.
        Return_list_metadata : list
            A list of metadata objects read from the metadata file.
        Success : bool
            Boolean value indicating if the data was loaded correctly.
    """

    Success = False

    metadata_dict = tsdf.load_metadata_from_path(path_to_metadata)

    Return_list_metadata = []
    Return_list_data = []

    for metadata_dict_key in metadata_dict.keys():
        metadata = metadata_dict[metadata_dict_key]

        Return_list_metadata.append(json.dumps(metadata.get_plain_tsdf_dict_copy()))

        data = metadata.load_binary()
        Return_list_data.append(data)

    Success = True

    return Return_list_data, Return_list_metadata, Success


# print(len(Return_list_metadata))


