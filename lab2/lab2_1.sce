x = [1 2 3]
y = [3 2 1]

function [x]=my_convol(a, b)
    a_length = length(a)
    b_length = length(b)
    r_length = a_length + b_length - 1
    x = zeros(1, r_length)
    
    for i=1:r_length
        s = 0
        for j=1:a_length
            try
                s = a(j) * b(i -j + 1) + s
            end
        end
        x(i) = s
    end
endfunction

result1 = my_convol(x, y)
result2 = convol(x, y)
disp(result1)
disp(result2)
disp(result1 - result2)
