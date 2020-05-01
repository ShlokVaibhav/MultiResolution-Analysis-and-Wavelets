num_iter=19;             %number of convolutions to be performed
delta=2^(-num_iter);     %separation between two consecutive x-points
daub_count=4;            %no. of daubechies coefficients         
b=-2+sqrt(3);
coefficients=[1,2+b,1+2*b,b];
points=(daub_count-1)/delta;
x=linspace(0,(daub_count-1),points+1);
high_pass=zeros(size(x));
low_pass=high_pass;
numbers=zeros(num_iter,points);
separation=0.5;
high_pass(1)=-b;
high_pass(1+separation/delta)=2*b+1;
high_pass(1+2*separation/delta)=-2-b;
high_pass(1+3*separation/delta)=2*b;
low_pass(1)=1;
low_pass(1+separation/delta)=2+b;
low_pass(1+2*separation/delta)=1+2*b;
low_pass(1+3*separation/delta)=b;
separation=separation/2;

%each iteration does a convolution
for i=2:num_iter
    index=1;
    ynew_high=zeros(size(high_pass));
    ynew_low=zeros(size(high_pass));

    while(index<=points)
        if(high_pass(index)~=0)
            for j=1:daub_count
                ynew_high(index+(j-1)*separation/delta)=ynew_high(index+(j-1)*separation/delta)+high_pass(index)*coefficients(j);
            end
        end
         if(low_pass(index)~=0)
            for j=1:daub_count
                ynew_low(index+(j-1)*separation/delta)=ynew_low(index+(j-1)*separation/delta)+low_pass(index)*coefficients(j);
            end
        end
        index=index+1;
    end
    high_pass=ynew_high;
    low_pass=ynew_low;
    separation=separation/2;
end
figure(1)
plot(x,high_pass/max(abs((high_pass))))
title 'Daubhecies time-domain mother wavelet'
figure(2)
plot(x,low_pass/max(abs((low_pass))))
title 'Daubhecies time-domain father wavelet'

