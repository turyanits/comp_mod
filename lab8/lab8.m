% Завдання 1
image = imread('C:/octaveassign/lab8/cats.jpg');

% Завдання 2
noisy_image_gaussian = imnoise(image, 'gaussian');
noisy_image_salt_pepper = imnoise(image, 'salt & pepper'); % імпульсний шум
noisy_image_poisson = imnoise(image, 'poisson');
noisy_image_speckle = imnoise(image, 'speckle'); % мультиплікативний шум

% Завдання 3
mask_size = [3, 5, 7];

% Завдання 4
filtered_images_gaussian = cell(size(mask_size));
filtered_images_salt_pepper = cell(size(mask_size));
filtered_images_poisson = cell(size(mask_size));
filtered_images_speckle = cell(size(mask_size));

for i = 1:numel(mask_size)
    mask = ones(mask_size(i));
    filtered_images_gaussian{i} = imfilter(noisy_image_gaussian, mask);
    filtered_images_salt_pepper{i} = imfilter(noisy_image_salt_pepper, mask);
    filtered_images_poisson{i} = imfilter(noisy_image_poisson, mask);
    filtered_images_speckle{i} = imfilter(noisy_image_speckle, mask);
end

% Виведення зображень
figure;

subplot(5, 4, [1 2 3 4]);
imshow(image);
title('Оригінал');

subplot(5, 4, 5);
imshow(noisy_image_gaussian);
title('Зашумлений гаусівський шум');

subplot(5, 4, 9);
imshow(noisy_image_salt_pepper);
title('Зашумлений імпульсний шум');

subplot(5, 4, 13);
imshow(noisy_image_poisson);
title('Зашумлений пуасонівський шум');

subplot(5, 4, 17);
imshow(noisy_image_speckle);
title('Зашумлений мультиплікативний шум');

num_plots = numel(mask_size);
subplot_rows = 5;
subplot_cols = 4;

for i = 1:num_plots
    subplot(subplot_rows, subplot_cols, i+1+subplot_cols);
    imshow(filtered_images_gaussian{i});
    title(sprintf('Відфільтрований (%dx%d, гаусівський шум)', mask_size(i), mask_size(i)));

    subplot(subplot_rows, subplot_cols, i+1+2*subplot_cols);
    imshow(filtered_images_salt_pepper{i});
    title(sprintf('Відфільтрований (%dx%d, імпульсний шум)', mask_size(i), mask_size(i)));

    subplot(subplot_rows, subplot_cols, i+1+3*subplot_cols);
    imshow(filtered_images_poisson{i});
    title(sprintf('Відфільтрований (%dx%d, пуасонівський шум)', mask_size(i), mask_size(i)));

    subplot(subplot_rows, subplot_cols, i+1+4*subplot_cols);
    imshow(filtered_images_speckle{i});
    title(sprintf('Відфільтрований (%dx%d, мультиплікативний шум)', mask_size(i), mask_size(i)));
end

