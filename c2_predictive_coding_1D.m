
A = [10 2 3 4; 5 6 7 8]
disp(A);

e = A;
for i = 1:size(A,1)
    for j = 2: size(A,2)
        e(i,j) = e(i,j)-A(i,j-1)
    end
end

sig = reshape(e, [], 1)
[D,x] = hist(sig, min(min(e)): max(max(e)))
sym = x(D > 0)
prob = D(D>0)/numel(e)
[dict, avglen] = huffmandict(sym, prob)
comp = huffmanenco(sig, dict)

dsig = huffmandeco(comp, dict)
e = reshape(dsig, size(A,1), size(A,2))

d = e;
for i = 1:size(A,1)
    for j = 2 : size(A,2)
        d(i,j) = d(i,j-1) + e(i,j)
    end
end
disp(d)




