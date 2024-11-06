function g = sigmoid(z)
    g=zeros(1,size(z,2));
    for(i=1:size(z,2))
       g(i)=1/(1+exp(-z(i)));
    end
end