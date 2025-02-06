function [Det_values] = find_optimal_threshold(data, target_rr_range,time_delay,threshold)
    % data: Your time series data
    % target_rr_range: Desired recurrence rate range [min, max]
%     data=DataInt;
%  target_rr_range=[4.99,5.01];
%     % Initial threshold guess (adjust as needed)
%     threshold = 0.0161;
%     time_delay= 15;

    % Step size for threshold adjustment (0.000001)
    step_size = 0.000001;

    % Tolerance for the recurrence rate (0.005)
    tolerance = 0.005;
 Det_values = []; % Initialize an empty matrix to store Det values
    while true
        % Perform RQA analysis with the current threshold
        y = phasespace(data,5,time_delay); %first number is embedding dimension, would find a number that is most recommedned and stick with it, second number is time delay
        recurdata = cerecurr_y(y);
        recurrpt = tdrecurr_y(recurdata,threshold);
        rqa_stat = recurrqa_y(recurrpt);


        % Extract recurrence rate
        RR = rqa_stat(1)
        Det= rqa_stat(2)
         Det_values = [Det_values; Det]; 
        % Check if the recurrence rate is within the target range
        if (target_rr_range(1) - tolerance <= RR) && (RR <= target_rr_range(2) + tolerance)
            optimal_threshold = threshold;
            display(optimal_threshold)         
            display(rqa_stat(1))
            display(rqa_stat(2))
            break;
        elseif RR < target_rr_range(1)
            threshold = threshold + step_size;
        else
            threshold = threshold - step_size;

        end
     
    end
   
end
