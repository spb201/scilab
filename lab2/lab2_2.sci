function [result]=generate_square(vec, N, A, T)
    result = 0
    for i=1:N
        k = -1 + 2*i
        result = result + ((-1)^(i+1))*cos(k*2*%pi*vec/T)/k
    end
    result = A/2+2*A*result/%pi
endfunction

function [result]=generate_triangle(vec, N, A, T)
    result = 0
    for i=1:N
        k = -1 + 2*i
        result = result + cos(k*2*%pi*vec/T)/k/k
    end
    result = 8*A/%pi/%pi*result
endfunction

function [result]=generate_saw(vec, N, A, T)
    result = 0
    for i=1:N
        k = i
        result = result + ((-1)^(i))*sin(k*2*%pi*vec/T)/k
    end
    result = 2*A/%pi*result
endfunction

vec = [0:0.1:10]
for i=1:8
    subplot(4, 2, i)
    x = generate_saw(vec, i, 1, 5)
    plot(vec, x)
end
