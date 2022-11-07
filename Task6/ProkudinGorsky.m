% Восстановление цветного изображения из изображений Прокудина-Горского

% Запись Red, Green и Blue каналов изображения из images
Red = imread('images/R.jpg');
Green = imread('images/G.jpg');
Blue = imread('images/B.jpg');

Green = imresize(Green, [size(Red, 1), size(Red, 2)]);
Blue = imresize(Blue, [size(Red, 1), size(Red, 2)]);

% Объединение каналов в одно изображение
RGB = cat(3, Red, Green, Blue);

% Вывод изображения
figure;
subplot(2, 2, 1);
imshow(RGB);
title('Current image');

% Вывод каналов в оставшиеся четверти окна
subplot(2,2,2);
imshow(Red);
title('Red channel');
subplot(2,2,3);
imshow(Green);
title('Green channel');
subplot(2,2,4);
imshow(Blue);
title('Blue channel');

% Вывести размеры каналов
disp(size(Red));
disp(size(Green));
disp(size(Blue));

RGB2 = ImageRandomMerge(Red, Green, Blue);

% Вывод восстановленного изображения в оставшуюся половину окна и подписать его
figure;
imshow(RGB2);
title('Restored image');