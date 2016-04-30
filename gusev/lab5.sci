function [res]=_filter(_b, _x)
    res = zeros(1, length(_x))
    for i=1:(length(_x) + 1)
        for j=0:5
            try
                res(i - 1) = res(i - 1) + _b(j + 1) * _x(i - j -1)
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
