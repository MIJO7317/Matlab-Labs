% Функция, которая принимает три канала RGB и возвращает цветное изображение.
% Перед объединением каналов их необходимо совместить друг с другом.
% Входные параметры: R - красный канал, G - зеленый канал, B - синий канал.
% Выходные параметры: I - цветное изображение.
function I = ImageRandomMerge(R, G, B)
    % Нахождение матрицы трансформации изображений G и B относительно R.
    % Определение контрольных точек с помощью функции cpselect.
    [movingPoints, fixedPoints] = cpselect(G, R, 'Wait', true);
    T1 = cp2tform(movingPoints, fixedPoints, "similarity");
    [movingPoints, fixedPoints] = cpselect(B, R, 'Wait', true);
    T2 = cp2tform(movingPoints, fixedPoints, "similarity");
    % Преобразование изображений G и B относительно R.
    G = imtransform(G, T1, 'XData', [1 size(R, 2)], 'YData', [1 size(R, 1)]);
    B = imtransform(B, T2, 'XData', [1 size(R, 2)], 'YData', [1 size(R, 1)]);
    % Объединение каналов.
    I = cat(3, R, G, B);
end

