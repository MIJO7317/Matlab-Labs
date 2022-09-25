%Функция, возвращающая траекторию ракеты
function r = GetTrajectory(start_point, v0, angle, g, k, m)
    %Если угол равен 0, то траектория будет точкой
    if angle == 0
        r = start_point;
        return;
    end
    
    T = 2*v0/g; %время полета ракеты
    
    %Решаем систему уравнений
    [~, rv] = ode45(@(t,rv) [rv(3); rv(4); -k/m*rv(3); -k/m*rv(4)-g], [0, T], [start_point(1), start_point(2), v0*cos(angle), v0*sin(angle)]);
    
    %Определение траектории полета ракеты
    r = rv(:,1:2);

    %Определение точки пересечения траектории с осью OX
    for i = 1:length(r)-1
        if r(i,2)*r(i+1,2) < 0
            %Определение координаты точки пересечения
            x_cross = r(i,1) + (r(i+1,1)-r(i,1))*abs(r(i,2))/(abs(r(i,2))+abs(r(i+1,2)));
            r = [r(1:i,:); [x_cross, 0]];
            break
        end
    end
end