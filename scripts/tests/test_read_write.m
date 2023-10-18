function tests = integration_test
    tests = functiontests(localfunctions);
end

function test_integration(testCase)
    % Test whether reading and writing of TSDF data works
    
    % Define the input and output paths
    input_path = 'data/ppp_format_meta_legacy.json';
    output_dir = 'data/test/';
    output_meta_name = 'output.json';
    
    % Test the python script for reading the legacy data
    [mat_list_metadata, mat_list_data] = load_legacy_tsdf_metadata_from_path(input_path);

    % Assert
    % Check if the python script for reading the legacy data was successful
    assert(length(mat_list_metadata) == 2, 'Number of identified metadata elements in not correct.');

    
    % Test the python script for saving the data
    mat_succ = save_tsdf_data(mat_list_metadata, mat_list_data, output_dir, output_meta_name);
    
    % Assert
    % Check if the python script for saving the data was successful
    assert(mat_succ, 'Failed to save data.');
    % Check if the saved file exists
    assert(exist(fullfile(output_dir, output_meta_name), 'file') == 2, 'Output file not found.');
end