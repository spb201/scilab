function [res]=_filter(_b, _x)
    res = zeros(1, length(_x))
    for i=0:length(_x)
        for j=0:length(_b)
            try
                res(i) = res(i) + _b(j + 1) * _x(i - j)
            end
        end
    end
endfunction

xk = [0, 0, 0, 0, 0, 0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]

subplot(1, 2, 1)
bk = [0.2 0.2 0.2 0.2 0.2]
plot(xk)
plot(_filter(bk, xk), 'ro')
plot(filter(bk, 1, xk), 'g+')


subplot(1, 2, 2)
bk = [-3/35 12/35 17/35 12/35 -3/35]
plot(xk)
plot(_filter(bk, xk), 'ro')
plot(filter(bk, 1, xk), 'g+')
