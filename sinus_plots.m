%Определение вектора x1, который используется в первых двух графиках.
x1 = linspace(4*pi, 12*pi, 1000);

%Определение вектора x2, который используется в третьем и четвертом графике.
x2 = linspace(0, pi, 1000);

%Определение вектора y_bad, являющегося первым значением функции bad_sinus для первого графика.
y_bad = bad_sinus(x1);

%Определение вектора y_good, являющегося первым значением функции good_sinus для второго графика.
y_good = good_sinus(x1);

%Определение вектора bad_iterations, являющегося вторым значением функции bad_sinus для третьего графика.
[~, bad_iterations] = bad_sinus(x2);

%Определение вектора good_iterations, являющегося вторым значением функции good_sinus для четвертого графика.
[~, good_iterations] = good_sinus(x2);

%Определение вектора y_true, являющегося значением функции sin для первого и второго графика.
y_true = sin(x1);

%Создание первого графика.
subplot1 = subplot(2, 2, 1);

%Построение первого графика:

%Функция bad_sinus имеет постельно голубой цвет и толщину линии 6.
plot(x1, y_bad, 'LineWidth', 6, 'Color', [0.5, 0.75, 1]);

%Функция sin имеет постельно оранжевый цвет и толщину линии 2.
hold on;
plot(x1, y_true, 'LineWidth', 2, 'Color', [1, 0.75, 0.5]);
hold off;

%Размер шрифта текста subplot1 равен 15.
set(subplot1, 'FontSize', 15);

%Задание заголовка первого графика "bad_sin vs sin", используя LaTeX.
%Заголовок жирный, курсивный и имеет размер 28.
title(subplot1, 'bad\_sin vs sin', 'Interpreter', 'latex', 'FontSize', 28, 'FontWeight', 'bold', 'FontAngle', 'italic');

%Задание подписи оси x и y первого графика "x" и "y", используя LaTeX.
xlabel(subplot1, '$x$', 'Interpreter', 'latex');
ylabel(subplot1, '$y$', 'Interpreter', 'latex');

%Задание легенды первого графика "bad\_sin" и "sin", используя LaTeX.
legend(subplot1, 'bad\_sin', 'sin', 'Interpreter', 'latex');

%Задание отметок на оси x первого графика.
xticks(subplot1, [4*pi, 6*pi, 8*pi, 10*pi, 12*pi]);

%Задание отметок на оси y первого графика.
yticks(subplot1, [-1.5, -1, -0.5, 0, 0.5, 1, 1.5]);

%Задание меток на оси x и y первого графика, используя LaTeX.
set(subplot1, 'XTickLabel', {'$4\pi$', '$6\pi$', '$8\pi$', '$10\pi$', '$12\pi$'}, 'TickLabelInterpreter', 'latex');
set(subplot1, 'YTickLabel', {'$-1.5$', '$-1$', '$-0.5$', '$0$', '$0.5$', '$1$', '$1.5$'}, 'TickLabelInterpreter', 'latex');

%Задание масштаба осей первого графика.
axis(subplot1, [4*pi, 12*pi, -1.5, 1.5]);

%Создание второго графика.
subplot2 = subplot(2, 2, 2);

%Построение второго графика:

%Функция good_sinus имеет постельно фиолетовый цвет и толщину линии 6.
plot(x1, y_good, 'LineWidth', 6, 'Color', [0.75, 0.5, 1]);

%Функция sin имеет постельно оранжевый цвет и толщину линии 2.
hold on;
plot(x1, y_true, 'LineWidth', 2, 'Color', [1, 0.75, 0.5]);
hold off;

%Размер шрифта текста subplot2 равен 15.
set(subplot2, 'FontSize', 15);

%Задание заголовка второго графика "good\_sin vs sin", используя LaTeX.
%Заголовок жирный, курсивный и имеет размер 28.
title(subplot2, 'good\_sin vs sin', 'Interpreter', 'latex', 'FontSize', 28, 'FontWeight', 'bold', 'FontAngle', 'italic');

%Задание подписи оси x и y второго графика "x" и "y", используя LaTeX.
xlabel(subplot2, '$x$', 'Interpreter', 'latex');
ylabel(subplot2, '$y$', 'Interpreter', 'latex');

%Задание легенды второго графика "good\_sin" и "sin", используя LaTeX.
legend(subplot2, 'good\_sin', 'sin', 'Interpreter', 'latex');

%Задание отметок на оси x второго графика.
xticks(subplot2, [4*pi, 6*pi, 8*pi, 10*pi, 12*pi]);

%Задание отметок на оси y второго графика.
yticks(subplot2, [-1.5, -1, -0.5, 0, 0.5, 1, 1.5]);

%Задание меток на оси x и y второго графика, используя LaTeX.
set(subplot2, 'XTickLabel', {'$4\pi$', '$6\pi$', '$8\pi$', '$10\pi$', '$12\pi$'}, 'TickLabelInterpreter', 'latex');
set(subplot2, 'YTickLabel', {'$-1.5$', '$-1$', '$-0.5$', '$0$', '$0.5$', '$1$', '$1.5$'}, 'TickLabelInterpreter', 'latex');

%Задание масштаба осей второго графика.
axis(subplot2, [4*pi, 12*pi, -1.5, 1.5]);

%Создание третьего графика.
subplot3 = subplot(2, 2, 3);

%Построение третьего графика:

%Функция bad_iterations имеет темно-голубой цвет и толщину линии 2.
plot(x2, bad_iterations, 'LineWidth', 2, 'Color', [0, 0.5, 0.75]);

%Размер шрифта текста subplot3 равен 15.
set(subplot3, 'FontSize', 15);

%Задание заголовка третьего графика "bad\_iterations", используя LaTeX.
%Заголовок жирный, курсивный и имеет размер 28.
title(subplot3, 'bad\_iterations', 'Interpreter', 'latex', 'FontSize', 28, 'FontWeight', 'bold', 'FontAngle', 'italic');

%Задание подписи оси x и y третьего графика "x" и "Количество итераций", используя LaTeX.
xlabel(subplot3, '$x$', 'Interpreter', 'latex');
ylabel(subplot3, 'Number of iterations', 'Interpreter', 'latex');

%Задание легенды третьего графика "bad\_iterations", используя LaTeX.
legend(subplot3, 'bad\_iterations', 'Interpreter', 'latex');

%Задание отметок на оси x третьего графика.
xticks(subplot3, [0, pi/6, pi/3, pi/2, 2*pi/3, 5*pi/6, pi]);

%Задание отметок на оси y третьего графика.
yticks(subplot3, [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]);

%Задание меток на оси x и y третьего графика, используя LaTeX.
set(subplot3, 'XTickLabel', {'$0$', '$\frac{\pi}{6}$', '$\frac{\pi}{3}$', '$\frac{\pi}{2}$', '$\frac{2\pi}{3}$', '$\frac{5\pi}{6}$', '$\pi$'}, 'TickLabelInterpreter', 'latex');
set(subplot3, 'YTickLabel', {'$0$', '$10$', '$20$', '$30$', '$40$', '$50$', '$60$', '$70$', '$80$', '$90$', '$100$'}, 'TickLabelInterpreter', 'latex');

%Задание масштаба осей третьего графика.
axis(subplot3, [0, pi, 0, 100]);

%Создание четвертого графика.
subplot4 = subplot(2, 2, 4);

%Построение четвертого графика:

%Функция good_iterations имеет темно-фиолетовый цвет и толщину линии 2.
plot(x2, good_iterations, 'LineWidth', 2, 'Color', [0.5, 0, 0.75]);

%Размер шрифта текста subplot4 равен 15.
set(subplot4, 'FontSize', 15);

%Задание заголовка четвертого графика "good\_iterations", используя LaTeX.
%Заголовок жирный, курсивный и имеет размер 28.
title(subplot4, 'good\_iterations', 'Interpreter', 'latex', 'FontSize', 28, 'FontWeight', 'bold', 'FontAngle', 'italic');

%Задание подписи оси x и y четвертого графика "x" и "Количество итераций", используя LaTeX.
xlabel(subplot4, '$x$', 'Interpreter', 'latex');
ylabel(subplot4, 'Number of iterations', 'Interpreter', 'latex');

%Задание легенды четвертого графика "good\_iterations", используя LaTeX.
legend(subplot4, 'good\_iterations', 'Interpreter', 'latex');

%Задание отметок на оси x четвертого графика.
xticks(subplot4, [0, pi/6, pi/3, pi/2, 2*pi/3, 5*pi/6, pi]);

%Задание отметок на оси y четвертого графика.
yticks(subplot4, [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]);

%Задание меток на оси x и y четвертого графика, используя LaTeX.
set(subplot4, 'XTickLabel', {'$0$', '$\frac{\pi}{6}$', '$\frac{\pi}{3}$', '$\frac{\pi}{2}$', '$\frac{2\pi}{3}$', '$\frac{5\pi}{6}$', '$\pi$'}, 'TickLabelInterpreter', 'latex');
set(subplot4, 'YTickLabel', {'$0$', '$10$', '$20$', '$30$', '$40$', '$50$', '$60$', '$70$', '$80$', '$90$', '$100$'}, 'TickLabelInterpreter', 'latex');

%Задание масштаба осей четвертого графика.
axis(subplot4, [0, pi, 0, 100]);