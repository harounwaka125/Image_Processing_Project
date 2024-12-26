function [] = min_filter(img)
    % Get the size of the input image
    [r, w, c] = size(img);

    % Check if the image is grayscale or RGB
    if c == 1
        A = img; % Grayscale image
    else
        A = rgb2gray(img); % Convert RGB to grayscale
    end

    % Initialize output image with zeros
    B = zeros(size(A));

    % Pad the input image
    modifyA = padarray(A, [1, 1]);

    % Define the window size (3x3)
    x = [1:3]';
    y = [1:3]';

    % Perform the min filtering
    for i = 1:size(modifyA, 1) - 2
        for j = 1:size(modifyA, 2) - 2
            % Extract the 3x3 window
            window = reshape(modifyA(i + x - 1, j + y - 1), [], 1);

            % Compute the minimum of the window
            B(i, j) = min(window);
        end
    end

    % Convert the result to uint8 for display
    B = uint8(B);

    % Display the filtered image
    imshow(B);
end
