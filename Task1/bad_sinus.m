%Функция синуса, определяющаяся из ряда Тейлора
%Принимаемое значение: x - вектор углов в радианах
%Возвращаемое значение: y - вектор значений синуса, iterations - вектор количества итераций
function [y, iterations] = bad_sinus(x)
    L = length(x);
    y = x;
    iterations = ones(1, L);
    for i = 1:L
        last_y = 0;
        while abs(y(i) - last_y) > 0
            term = (-1)^iterations(i) * (x(i)^(2*iterations(i)+1) / factorial(2*iterations(i)+1));
            last_y = y(i);
            y(i) = y(i) + term;
            iterations(i) = iterations(i) + 1;
        end
    end
end

