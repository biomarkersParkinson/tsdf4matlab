function [matlab_dicts] = py2mat_listmeta(py_dicts)
    % Convert a list of Python dictionaries (Python variables) to a list of MATLAB structures.
    %
    % Args:
    %   py_dicts: A list of Python dictionaries.
    %
    % Returns:
    %   matlab_dicts: A list of MATLAB structures.

    % Initialize MATLAB structures
    matlab_dicts = cell(size(py_dicts));
    
    % Convert Python dictionaries to MATLAB structures
    for i = 1:numel(py_dicts)
        matlab_dicts{i} = jsondecode(string(py_dicts{i}));
    end
end
