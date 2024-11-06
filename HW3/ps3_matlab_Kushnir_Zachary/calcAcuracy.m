function a = calcAcuracy(y_pred,y_test)
    a=0;
    for(i=1:length(y_pred))
        if(y_pred(i)==y_test(i))
            a=a+1;
        end
    end
    a=a/length(y_pred);
end