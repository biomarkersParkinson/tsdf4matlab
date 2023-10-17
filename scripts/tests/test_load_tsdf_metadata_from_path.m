function tests = test_load_tsdf_metadata_from_path
    tests = functiontests(localfunctions);
end

function test_successful_load(testCase)
    % Test that the function can load the metadata from a valid path.
    
    % Arrange
    input_path = 'data/ppp_format_meta.json';
    
    % Act
    [mat_list_metadata, mat_list_data] = load_tsdf_metadata_from_path(input_path);
    
    % Assert
    assert(length(mat_list_metadata) == 2, 'Number of identified metadata elements in not correct.');
    assert(length(mat_list_data) == 2, 'Number of identified binary files in not correct.');
end

function test_invalid_path(testCase)
    % Test that the function throws an error when the json file is not complete.

    % Arrange
    input_path = 'data/ppp_format_meta_legacy.json';

    % Act
    try
        [mat_list_metadata, mat_list_data] = load_tsdf_metadata_from_path(input_path);
        assert(false, 'No error was thrown when the json file was incomplete.');
    catch
        % Assert
        assert(true);
    end
