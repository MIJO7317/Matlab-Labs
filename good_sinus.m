%Функция синуса, определяющаяся из ряда Тейлора. 
%В отличии от bad_sinus вычисляет значение синуса на промежутке от 0 до pi/2.
%При других входных значениях функция пользуется свойством периодичности синуса.
%Принимаемое значение: x - вектор углов в радианах
%Возвращаемое значение: y - вектор значений синуса, iterations - вектор количества итераций

% %Красивое решение
% function [y, iterations] = good_sinus(x)
%     [y, iterations] = bad_sinus(mod(x, 2*pi));
% end

%Более быстрое решение
function [y, iterations] = good_sinus(x)
    x_limited = mod(x, 2*pi);
    for i = 1:length(x_limited)
        if (x_limited(i) > pi/2) && (x_limited(i) <= pi)
            x_limited(i) = pi - x_limited(i);
        elseif (x_limited(i) > pi) && (x_limited(i) <= 3*pi/2)
            x_limited(i) = pi - x_limited(i);
        elseif (x_limited(i) > 3*pi/2) && (x_limited(i) <= 2*pi)
            x_limited(i) = x_limited(i) - 2*pi;
        else
            x_limited(i) = x_limited(i);
        end
    end
    [y, iterations] = bad_sinus(x_limited);
end 



