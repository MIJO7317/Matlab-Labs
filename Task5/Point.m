% Создание класса точки с двумя координатами x и y
classdef Point
    properties
        x double
        y double
    end
    methods
        % Конструктор класса
        function obj = Point(x, y)
            if nargin == 2
                obj.x = x;
                obj.y = y;
            elseif nargin == 0
                obj.x = 0;
                obj.y = 0;
            else
                error('Wrong number of arguments');
            end
        end
    end
end