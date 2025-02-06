function output_signal = windowed_RQA_overlap(input_signal, window_size, starting_threshold)
    signal_length = length(input_signal);
    overlap = 0.50; % 0.25= 25% overlap
    increment = floor(window_size * (1 - overlap)); % Calculate the increment

    % Calculate the number of windows. We need to be careful not to go past the end of the signal
    num_windows = floor((signal_length - window_size) / increment) + 1;
    output_signal = zeros(1, num_windows);

    for i = 1:num_windows
        start_index = (i - 1) * increment + 1;
        end_index = start_index + window_size - 1;

        % Check if the end index exceeds the signal length
        if end_index > signal_length
            break; % Exit the loop if it does
        end

        windowed_data = input_signal(start_index:end_index);
        delay = mutual(windowed_data, 5, 200);
        td = time_delay(delay);
        x = find_optimal_threshold(windowed_data, [4.995, 5.005], td - 1, starting_threshold);

        [numRows, ~] = size(x); % Use ~ to discard the second output
        lastRow = x(numRows, :);
        output_signal(i) = lastRow;
    end
end