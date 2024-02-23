function indices = tsdf_values_idx(metadata_list, X, week)
    indices = [];
    for i = 1:length(metadata_list)
        % Use regular expression to match the pattern
        expression = sprintf('WatchData\\.(PPG|IMU|EDA|ECG)\\.Week%s\\.raw_segment\\d+_%s\\.bin', num2str(week), X);
        if ~isempty(regexp(metadata_list{i}.file_name, expression, 'once'))
            indices = [indices, i];
        end
    end
end