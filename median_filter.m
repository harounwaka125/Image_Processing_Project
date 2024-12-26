function [] = median_filter(img)
    % Define filter size (e.g., 3x3)
    M = 3; N = 3;
    pad_size = [floor(M/2), floor(N/2)];

    % Pad the image to handle boundaries
    img = padarray(img, pad_size, 'replicate');
    [h, w, l] = size(img);

    % Initialize the output image
    if l == 1
        % For grayscale images
        B = zeros(h, w);
    else
        % For RGB images
        B = zeros(h, w, l);
    end

    % Apply the median filter
    for k = 1:l  % Loop over channels (1 for grayscale, 3 for RGB)
        for i = 2:h-1
            for j = 2:w-1
                % Extract the 3x3 neighborhood
                temp = img(i-1:i+1, j-1:j+1, k);

                % Compute the median
                B(i, j, k) = median(temp(:));
            end
        end
    end

    % Remove padding and cast to uint8
    B = uint8(B(pad_size(1)+1:end-pad_size(1), pad_size(2)+1:end-pad_size(2), :));

    % Display the filtered image
    imshow(B);
end
