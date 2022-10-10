% Класс треугольника состоящего из 3 точек Point
classdef Triangle
    properties
        Point1 Point
        Point2 Point
        Point3 Point
    end
    methods
        % Конструкторы класса
        function obj = Triangle(inputArg1, inputArg2, inputArg3, inputArg4, inputArg5, inputArg6)
            if nargin == 6
                obj.Point1 = Point(inputArg1, inputArg2);
                obj.Point2 = Point(inputArg3, inputArg4);
                obj.Point3 = Point(inputArg5, inputArg6);
            elseif nargin == 3
                obj.Point1 = inputArg1;
                obj.Point2 = inputArg2;
                obj.Point3 = inputArg3;
            elseif nargin == 0
                obj.Point1 = Point();
                obj.Point2 = Point();
                obj.Point3 = Point();
            else
                error('Wrong number of input arguments');
            end 
        end
        % Метод для рисования треугольника
        function draw(obj, color)
            if nargin == 1
                color = 'k';
            end
            plot([obj.Point1.x obj.Point2.x obj.Point3.x obj.Point1.x], [obj.Point1.y obj.Point2.y obj.Point3.y obj.Point1.y], color);
        end
    end
end