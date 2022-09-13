%Функция, которая принимает матрицу и способ сортировки (по часовой или против часовой)
%Возвращает отсортированную по спирали входную матрицу используя входной способ сортировки
function [sortedMatrix] = spiralSort(matrix, sortType)
    %Проверка входных данных
    if ~ismatrix(matrix)
        error('Input matrix is not a matrix');
    end
    if ~ischar(sortType)
        error('Input sort type is not a string');
    end
    if ~strcmp(sortType, 'clockwise') && ~strcmp(sortType, 'counterclockwise')
        error('Input sort type is not a valid sort type');
    end
    %Получение размеров матрицы
    [rows, columns] = size(matrix);
    %Проверка размеров матрицы
    if rows ~= columns
        error('Input matrix is not a square matrix');
    end
    %Преобразование матрицы в плоский вектор flattenMatrix
    flattenMatrix = reshape(matrix, 1, rows * columns);
    %Сортировка вектора flattenMatrix
    if strcmp(sortType, 'clockwise')
        flattenMatrix = sort(flattenMatrix, 'descend');
    else
        flattenMatrix = sort(flattenMatrix, 'ascend');
    end
    %Создание пустой матрицы sortedMatrix
    sortedMatrix = zeros(rows, columns);
    %Создание спиральной матрицы того же размера
    spiralMatrix = spiral(rows);
    %Присвоение элементов вектора flattenMatrix элементам спиральной матрицы spiralMatrix
    for i = 1:rows
        for j = 1:columns
            sortedMatrix(i, j) = flattenMatrix(spiralMatrix(i, j));
        end
    end
end
