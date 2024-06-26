function [mat_list_metadata, mat_list_data] = load_tsdf_metadata_from_path(mat_metadata_path)
    % Load metadata and data from a path to a TSDF metadata json file
    % Input:
    %   mat_metadata_path: path to the .mat file containing the metadata
    % Output:
    %   mat_list_metadata: list of the metadata objects describing each binary file
    %   mat_list_data: list of time series data (each element representing a content of a binary file)

    % Add the path to the matlab scripts
    addpath(genpath('.'));
    
    % Convert the path to a string
    py_metadata_path = py.str(mat_metadata_path);

    % Run the python script load_tsdf_metadata_from_path.py and get the 3 outputs
    [py_succ, py_list_metadata, py_list_data] = pyrunfile("load_tsdf_metadata_from_path.py", ["Success" "Return_list_metadata" "Return_list_data"], path_to_metadata=py_metadata_path);

    % Convert Python boolean to MATLAB logical
    mat_succ = logical(py_succ);
    


    % Convert to MATLAB data structures in case the executions was successful 
    if mat_succ
      mat_list_metadata = py2mat_listmeta(py_list_metadata);
      mat_list_data = py2mat_listnumpy2(py_list_data);
    else
       mat_list_metadata = [];
       mat_list_data = [];
    end
    
    
end
