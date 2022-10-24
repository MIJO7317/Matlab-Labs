% Восстановление цветного изображения из изображений Прокудина-Горского

% Запись цветного изображения из images в переменную
RGB = imread('images/color_image_1.jpg');

% Вывод цветного изображения в первую четверть окна и подписать его
figure;
subplot(2,2,1);
imshow(RGB);
title('Current image');

% Применение функции ImageRandomSplit для разделения изображения на 3 канала
[Red, Green, Blue] = ImageRandomSplit(RGB);

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

% Объединение каналов в одно изображение
RGB2 = cat(3, Red, Green, Blue);

% Вывод объединенного изображения в 1/2 окна и подписать его
figure;
subplot(1,2,1);
imshow(RGB2);
title('Merged image');

% Восстановление цветного изображения из каналов
RGB2 = ImageRandomMerge(Red, Green, Blue);

% Вывод восстановленного изображения в оставшуюся половину окна и подписать его
subplot(1,2,2);
imshow(RGB2);
title('Restored image');