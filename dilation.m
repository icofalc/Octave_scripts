function prova()
    pkg load image
    imagea=imread('originblack.png');
    imageb=imread('circleblack.png');

    imagec = imagea | imageb ;
    
    imaged = imread("dbw.png");

    A = imagec & imaged;
    #da qui in poi faccio la dilation su b8

    B=[1 1 1 1 1 1 1 1 1 1;
      1 1 1 1 1 1 1 1 1 1;
      1 1 1 1 1 1 1 1 1 1;
      1 1 1 1 1 1 1 1 1 1;
      1 1 1 1 1 1 1 1 1 1;
      1 1 1 1 1 1 1 1 1 1;
      1 1 1 1 1 1 1 1 1 1;
      1 1 1 1 1 1 1 1 1 1;
      1 1 1 1 1 1 1 1 1 1;
      1 1 1 1 1 1 1 1 1 1];

    C=padarray(A,[1 1]);

    B9=false(size(A));
    for i=1:size(C,1)-9
        for j=1:size(C,2)-9
            
            B9(i,j)=sum(sum(B&C(i:i+9,j:j+9)));
        end
    end

    imwrite(B9,"B9.png")

    finale = imaged - B9;
    imwrite(finale,"fin.png")
    


    BI=[0 0 0 
    0 1 0 ;
    0 0 0];

    C1I=padarray(finale,[1 1]);

    B1I=false(size(finale));
    for i=1:size(C1I,1)-2
        for j=1:size(C1I,2)-2
            B1I(i,j)=sum(sum(BI & C1I(i:i+2,j:j+2)));
        end
    end

    result = B1I | B9;
    imshow(result)

endfunction   
prova();




function prova_binarizza_img()
    imagea=imread('D.png');
    

    imageabw = im2bw (imagea, "moments");

    imwrite (imageabw, "dbw.png");
    
 
endfunction
prova_binarizza_img()




















