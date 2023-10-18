import os
from typing import List
import numpy as np
import json
import tsdf as tsdf

def load_tsdf_metadata_from_path(path_to_metadata:str):
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

    metadata_dict:dict = tsdf.load_metadata_from_path(path_to_metadata)

    Return_list_metadata:list = []
    Return_list_data:list = []

    for metadata_dict_key in metadata_dict.keys():
        metadata = metadata_dict[metadata_dict_key]

        Return_list_metadata.append(json.dumps(metadata.get_plain_tsdf_dict_copy()))

        data = tsdf.load_binary_from_metadata(metadata)
        Return_list_data.append(data)

    Success = True

    return Return_list_data, Return_list_metadata, Success


# print(len(Return_list_metadata))


def save_metadata_and_binary_files(
    py_list_metadata: List[any], 
    py_list_data: List[np.ndarray], 
    py_dir_path: str, 
    py_metadata_file_name: str
) -> bool:
    """
    Module for saving the metadata and the binary files from a data objects.

    Parameters
    ----------
    py_list_metadata : list
        List of the metadata objects describing each binary file.
    py_list_data : list
        List of time series data (each element representing a content of a binary file).
    py_dir_path : str
        Path to the directory where the data should be saved.
    py_metadata_file_name : str
        Name of the metadata file.

    Returns
    -------
    bool
        Boolean value indicating if the data was loaded correctly.
    """

    Success = False

    py_updated_list_metadata = []

    for metadata, data in zip(py_list_metadata, py_list_data):
        file_name = metadata['file_name']
        new_metadata = tsdf.write_binary_file(py_dir_path, file_name, data, metadata)
        py_updated_list_metadata.append(new_metadata)

    tsdf.write_metadata(py_updated_list_metadata, py_metadata_file_name)

    Success = True

    return Success
