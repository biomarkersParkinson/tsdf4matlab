function [py_dicts, py_arrays] = load_tsdf_metadata_from_path(mat_metadata_path)
    % Load the metadata and data from a path to a .mat file
    % Input:
    %   mat_metadata_path: path to the .mat file containing the metadata
    % Output:
    %   py_dicts: list of python dictionaries containing the metadata
    %   py_arrays: list of python arrays containing the data

    mat_metadata_path= '~/git/tsdf4matlab/data/example_10_3_float32_meta.json';  % Provide the actual path
    py_metadata_path = py.str(mat_metadata_path);

    % Run the python script load_tsdf_metadata_from_path.py and get the 3 outputs
    [py_succ, py_list_metadata, py_list_data] = pyrunfile("load_tsdf_metadata_from_path.py",["Success" "Return_list_metadata" "Return_list_data"], path_to_metadata=py_metadata_path);

    % Convert Python boolean to MATLAB logical
    mat_succ = logical(py_succ);
    % Display the value of mat_succ
    disp(mat_succ);


    % Convert to MATLAB data structures in case the executions was successful 
    if mat_succ
        [mat_list_metadata, mat_list_data] = py2mat_list_dict(py_list_metadata, py_list_data);
    else
        mat_list_metadata = [];
        mat_list_data = [];
    end
    
    
end
