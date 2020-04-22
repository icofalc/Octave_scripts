function [conteggio]=conta(valore,array)
    conteggio = 0;
    for i = 1 : length(array)
        if valore == array(i)
            conteggio = conteggio+1;
        endif
    endfor
    
endfunction
#funzione che conta le occorrenze di un valore in un array



function [x,valori]=hystogram(x)
    
    image=imread(x);
    #imshow(image); #scommentare se si vuole vedere l'immagine

    ired=image(:,:,1);
    #mettere 1 per canale red, 2 per green, 3 per blue
    numel(ired);
   
    minimo= min(min(ired));
    massimo=max(max(ired));

    ired=reshape(ired,1,numel(ired));
    
    valori=zeros(1,massimo+1);
    #length(valori)

    for i = 1 : length(valori)
        valori(i)=sum(ired == i);
        #valori(i)=conta(i,ired);
    endfor

    figure
    x=1:1:length(valori);
    plot(x,valori)
    
    
endfunction


#hystogram('lena.png')


function nm(x)
    hystogram(x);
    image=imread(x);
    #imshow(image); #scommentare se si vuole vedere l'immagine

    ired=image(:,:,1);
    #mettere 1 per canale red, 2 per green, 3 per blue
    numel(ired);#funzione che calcola numero di elementi

    minimo= min(min(ired))
    massimo=max(max(ired))

    ired=reshape(ired,1,numel(ired));
    
    costante=255./double(massimo.-minimo)
    
    for i = 1:1: length(ired);
        if and((ired(i) >= minimo),(ired(i)<=massimo))
            ired(i) = ired(i)-minimo;
            ired(i) = ired(i)*costante;
        endif
    endfor
    
    valori=zeros(1,massimo+1);
#length(valori)

    for i = 1 : length(valori)
        valori(i)=sum(ired == i);
        #valori(i)=conta(i,ired);
    endfor

    figure
    x=1:1:length(valori);
    plot(x,valori)
    

endfunction

#nm('lena.png')

function eq(x)
    nm(x)
    image=imread(x);
     #imshow(image); #scommentare se si vuole vedere l'immagine

    ired=image(:,:,1);
    
    mn=numel(ired);
    mn=double(mn);

    ired=reshape(ired,1,numel(ired));
    
    valori=zeros(1,256);
    #length(valori)
    array_temp=zeros(1,256);
    for i = 1 : length(valori)
        valori(i)=sum(ired == i);
        array_temp(i)=double(valori(i)/mn);
    endfor

    Tri=[]
    for i = 1 : 256
        accumulatore=0;
        for j = 1 : i
            accumulatore=accumulatore.+array_temp(j);
        endfor
    Tri(i)=255.*accumulatore;
    endfor

    finale=zeros(1,256);
    for i=1:256
        r=ired(i);
        temp=Tri(r);
        finale(i)=temp;
    endfor

    finale;

    figure
    x=1:1:length(finale);
    plot(x,finale)

endfunction

eq('lena.png')

