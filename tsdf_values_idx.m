function indices = tsdf_values_idx(metadata_list, suffix)
    indices = [];
    for i = 1:length(metadata_list)
        % Use regular expression to match the pattern
        expression = ['**' suffix '.bin'];
        if ~isempty(regexp(metadata_list{i}.file_name, expression, 'once'))
            indices = i;
            return
        end
    end
end