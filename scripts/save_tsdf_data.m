function [mat_succ] = save_tsdf_data(mat_list_metadata, mat_list_data, mat_dir_path, mat_metadata_file_name)
    % Save the metadata and data to the file system under the given path
    % Input:
    %   mat_list_metadata: list of the metadata objects describing each binary file
    %   mat_list_data: list of time series data (each element representing a content of a binary file)
    %   mat_dir_path: path to the dir where the data should be saved
    %   mat_metadata_file_name: name of the metadata file
    % Output:
    %   mat_succ: boolean value determening if the execution was successful or not

    % Add the path to the matlab scripts
    addpath(genpath('.'));

    % Check if the input lists match in size
      if length(mat_list_metadata) ~= length(mat_list_data)
         error("The input lists do not match in size");
      end

    % Convert MATLAB data structures to Python data structures
    py_list_metadata = mat2py_listmeta(mat_list_metadata);
    py_list_data = mat2py_listnumpy(mat_list_data);
    py_dir_path = py.str(mat_dir_path);
    py_metadata_file_name = py.str(mat_metadata_file_name);

   
    % Run the python script save_tsdf_data.py and get the 3 outputs
    [py_succ, ~] = pyrunfile("tsdf_python_interface\save_tsdf_data.py",["Success" "Return_list_metadata" "Return_list_data"], py_list_metadata=py_list_metadata, py_list_data=py_list_data, py_dir_path=py_dir_path, py_metadata_file_name=py_metadata_file_name);

    % Convert Python boolean to MATLAB logical
    mat_succ = logical(py_succ);
    % Display the value of mat_succ
    disp(mat_succ);

    
end
