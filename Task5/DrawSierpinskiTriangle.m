% Функция, которая строит треугольник Серпинского

function DrawSierpinskiTriangle (inputArg1, inputArg2, inputArg3, inputArg4, inputArg5, inputArg6, inputArg7)
    if nargin == 2
        triangle = inputArg1;
        n = inputArg2;
    elseif nargin == 7
        triangle = Triangle(inputArg1, inputArg2, inputArg3, inputArg4, inputArg5, inputArg6);
        n = inputArg7;
    else
        error('Wrong number of arguments');
    end

    % Нарисовать треугольник
    triangle.draw
    hold on
    if  n > 0
        % Создание новых треугольников
        newTriangle1 = Triangle(triangle.Point1.x, triangle.Point1.y, (triangle.Point1.x + triangle.Point2.x)/2, (triangle.Point1.y + triangle.Point2.y)/2, (triangle.Point1.x + triangle.Point3.x)/2, (triangle.Point1.y + triangle.Point3.y)/2);
        newTriangle2 = Triangle((triangle.Point1.x + triangle.Point2.x)/2, (triangle.Point1.y + triangle.Point2.y)/2, triangle.Point2.x, triangle.Point2.y, (triangle.Point2.x + triangle.Point3.x)/2, (triangle.Point2.y + triangle.Point3.y)/2);
        newTriangle3 = Triangle((triangle.Point1.x + triangle.Point3.x)/2, (triangle.Point1.y + triangle.Point3.y)/2, (triangle.Point2.x + triangle.Point3.x)/2, (triangle.Point2.y + triangle.Point3.y)/2, triangle.Point3.x, triangle.Point3.y);
        % Рекурсивно нарисовать треугольники Серпинского
        DrawSierpinskiTriangle(newTriangle1, n-1);
        DrawSierpinskiTriangle(newTriangle2, n-1);
        DrawSierpinskiTriangle(newTriangle3, n-1);
    end
end

% Координаты точек равностороннего треугольника
% x1 = 0 ; y1 = 0 ;
% x2 = 1 ; y2 = 0 ;
% x3 = 0.5 ; y3 = sqrt ( 3 ) / 2 ;
