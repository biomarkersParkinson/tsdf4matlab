function [matlab_dicts, matlab_arrays] = py2mat_list_dict(py_arrays, py_dicts)
    % Convert a list of numpy arrays and a list of Python dictionaries to
    % a list of MATLAB arrays and a list of MATLAB structures.
    %
    % Args:
    %   py_arrays: A list of numpy arrays.
    %   py_dicts: A list of Python dictionaries.
    %
    % Returns:
    %   matlab_dicts: A list of MATLAB structures.
    %   matlab_arrays: A list of MATLAB arrays.

    % Initialize MATLAB structures
    matlab_dicts = cell(size(py_dicts));
    matlab_arrays = cell(size(py_arrays));
    
    % Convert Python dictionaries to MATLAB structures
    for i = 1:numel(py_dicts)
        matlab_dicts{i} = jsondecode(string(py_dicts{i}));
    end
    
    % Convert numpy arrays to MATLAB arrays
    for i = 1:numel(py_arrays)
        % Convert the numpy array to a MATLAB array
        matlab_arrays{i} = double(py.array.array('d', py.numpy.nditer(py_arrays{i})));
        % Reshape the array if necessary
        dims = cell(py_arrays{i}.shape);
        if numel(dims) > 1
            matlab_arrays{i} = reshape(matlab_arrays{i}, dims{:});
        end
    end
end
