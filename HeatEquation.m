%Численный метод решения задачи тепопроводности.
%Дифференциальное уравнение: u_t = u_xx
%Граничные условия: u(0,t) = u(1,t) = 0
%Начальное условие: u(x,0) = sin(2*pi*x)
%Решение: u(x,t) = sin(2*pi*x)*exp(-4*pi^2*t)   

%Параметры сетки
a = 0; b = 1; %Границы отрезка
N = 100; %Число узлов
h = (b-a)/N; %Шаг сетки

%Константы
lambda = 0.5; %Число Куранта

%Параметры времени
T = 0.1; %Время расчета
tau = lambda*h^2; %Шаг по времени
M = round(T/tau); %Число шагов по времени

%Инициализация массивов
u = zeros(N,M);
x = linspace(a,b,N);
t = linspace(0,T,M);

%Начальное условие
u(:,1) = sin(2*pi*x);

%Граничные условия
u(1,:) = 0;
u(N,:) = 0;

%Решение
%Цикл по времени
for n = 1:M-1
    %Разностная схема, используя матричные операции
    u(2:N-1,n+1) = u(2:N-1,n) + tau/h^2*(u(3:N,n)-2*u(2:N-1,n)+u(1:N-2,n));
end

%График решения
mesh(x,t,u');
xlabel('x');
ylabel('t');
zlabel('u(x,t)');
title('Numerical solution');

%Аналитическое решение
u_an = sin(2*pi*x)'*exp(-4*pi^2*t);

%График аналитического решения
figure;
mesh(x,t,u_an');
xlabel('x');
ylabel('t');
zlabel('u(x,t)');
title('Analytical solution');

%Вывод самой большой ошибки
disp('Max error:');
disp(max(max(abs(u_an-u))));

% %Построение анимации и сохранение в виде GIF-файла
% figure;
% for n = 1:M
%     plot(x,u(:,n));
%     axis([a b -1 1]);
%     xlabel('x');
%     ylabel('u(x,t)');
%     title(['Numerical solution, t = ',num2str(t(n))]);
%     drawnow;
%     frame = getframe(1);
%     im = frame2im(frame);
%     [imind,cm] = rgb2ind(im,256);
%     if n == 1
%         imwrite(imind,cm,'animation.gif','gif','Loopcount',inf);
%     else
%         imwrite(imind,cm,'animation.gif','gif','WriteMode','append');
%     end
% end

%Что изменилось в сравнении с предыдущей версией?
%1. Использованы матричные операции для ускорения расчетов.
%2. Добавлено построение анимации и сохранение в виде GIF-файла.
