files = dir('*.mat');

for file = files'
    csv = load(file.name);
    x_alpha1=413.7; %x-coordinate of the anticipated region in the landmark
    y_alpha1=385.1; %y-coordinate of the anticipated region in the landmark
    p1=size(csv.x_new);
    ncount1=0;
    %formation of array of all the distances.
    for i = 1:p1;
        dist_alpha1(i)=0;
    end
    for i = 1:p1;
        dist_alpha1(i)=sqrt(((csv.x_new(i)-x_alpha1).^2)+((csv.y_new(i)-y_alpha1).^2));
        
    end
    save((file.name),'dist_alpha1','-append');
    
    %formation of an array which can be used for binary purpose.
    for i = 1:p1;
            flag1(i)=0;
    end
    
    %flagging the required part as '1'
    for i = 1:p1;
        if dist_alpha1(i)<50;
            flag1(i)=1;
        else
            continue;
        end
    end
    
    %formation of new array, which can be used to count each '1' sequence.
    for i = 1:(p1);
        count1(i)=1;
    end

    %formation of new array, which can be used to mark the beginning of '1'
    %sequence
    for i = 1:(p1);
        b1(i)=0;
    end
    
    %correct till now.
    
    k=1;
    i=1;
    o=1;
    bg1=0;
    for i=1:p1;
        if flag1(i)==0 || flag1(i)==1;
            bg1=bg1+1;
        end
    end
    %correct till now.
    
    i=1;
    while flag1(i)==1 || flag1(i)==0;
        if i>1 && flag1(i-1)==0 && flag1(i)==1 && flag1(i+1)==0;
            flag1(i)=0;
        end
        i=i+1;
        if i>=bg1;
            break;
        end
    end
    i=1;
    while flag1(i)==1 || flag1(i)==0;
        if i==1 && flag1(i)==1; 
                b1(k)=1;
                k=k+1;
        end

        if flag1(i)==1 && flag1(i+1)==1;
            count1(o)=count1(o)+1;
        end
        if i>1 && flag1(i-1)==1 && flag1(i)==1 && flag1(i+1)==0;
            o=o+1;
        end

        if i>1 && flag1(i+1)==1 && flag1(i)==0;
                b1(k)=i+1;
                k=k+1;
        end
        i=i+1;
        if i>=bg1;
            break;
        end
    end
    dcount1=transpose(count1);
    for i=1:size(dcount1);
        if dcount1(i)>10;
            ncount1=ncount1+1;
        end
    end
    
    
    o=1;
    i=1;
    
    while count1(o)>1;
        if count1(o)<10;
            dcount1(o)=0;
            o=o+1;
        else
            o=o+1;
        end
    end
    
    
    for i=1:bg1;
        ccount1(i)=0;
    end
    tccount=transpose(ccount1);
    o=1;
    for i=1:bg1-1;
        if dcount1(i)~=0;
            tccount1(o)=dcount1(i);
            o=o+1;
        end
    end
    for i=1:bg1-1;
        bk1(i)=0;
    end
    o=1;
    for i=1:bg1-1;
        if count1(i)>10;
            bk1(o)=b1(i);
            o=o+1;
        end
    end
    beginning_of_anticipation1=transpose(bk1);
    
    for i= 1:bg1-3;
        if beginning_of_anticipation1(i)==beginning_of_anticipation1(i+1);
            beginning_of_anticipation1(i+1)=beginning_of_anticipation1(i+2);
        end
    end
    
    %Number of times it has stopped.
    NumOfAnticipation1=ncount1;
    disp('The number of times fly entered the anticipated area:');
    disp(NumOfAnticipation1);
    save((file.name),'NumOfAnticipation1','-append');
    if ncount1>0;
        for i = 1:ncount1;
            ending_of_anticipation1(i)=0;
        end


        o=1;
        for i = 1:ncount1;
            twoD_beginEnd_of_anticipation1(o,i)=0;
            twoD_beginEnd_of_anticipation1(o+1,i)=0;
        end
        for i = 1:ncount1;
            twoD_beginEnd_of_anticipation1(o,i)=beginning_of_anticipation1(i);
            twoD_beginEnd_of_anticipation1(o+1,i)=beginning_of_anticipation1(i)+tccount1(i)-1;
        end



        TranstwoD_beginEnd_of_anticipation1=transpose(twoD_beginEnd_of_anticipation1);
        save((file.name),'TranstwoD_beginEnd_of_anticipation1','-append');
        for i = 1:ncount1;
            twoD_beginEnd_of_anticipation1(o,i)=0;
            twoD_beginEnd_of_anticipation1(o+1,i)=0;
        end

        twoD_beginEnd_of_anticipation1=twoD_beginEnd_of_anticipation1(1:end-(end-1),1:end-(end-1));
    end
end


%----------------------------part1-done-------------------------------------------------------------------------


for file = files'
    csv = load(file.name);
    x_alpha2=367.5; %x-coordinate of the anticipated region in the landmark
    y_alpha2=458.9; %y-coordinate of the anticipated region in the landmark
    p2=size(csv.x_new);
    ncount2=0;
    %formation of array of all the distances.
    for i = 1:p2;
        dist_alpha2(i)=0;
    end
    for i = 1:p2;
        dist_alpha2(i)=sqrt(((csv.x_new(i)-x_alpha2).^2)+((csv.y_new(i)-y_alpha2).^2));
        
    end
    save((file.name),'dist_alpha1','-append');
    
    %formation of an array which can be used for binary purpose.
    for i = 1:p2;
            flag2(i)=0;
    end
    
    %flagging the required part as '1'
    for i = 1:p2;
        if dist_alpha2(i)<50;
            flag2(i)=1;
        else
            continue;
        end
    end
    
    %formation of new array, which can be used to count each '1' sequence.
    for i = 1:(p2);
        count2(i)=1;
    end

    %formation of new array, which can be used to mark the beginning of '1'
    %sequence
    for i = 1:(p2);
        b2(i)=0;
    end
    
    %correct till now.
    
    k=1;
    i=1;
    o=1;
    bg2=0;
    for i=1:p2;
        if flag2(i)==0 || flag2(i)==1;
            bg2=bg2+1;
        end
    end
    %correct till now.
    
    i=1;
    while flag2(i)==1 || flag2(i)==0;
        if i>1 && flag2(i-1)==0 && flag2(i)==1 && flag2(i+1)==0;
            flag2(i)=0;
        end
        i=i+1;
        if i>=bg2;
            break;
        end
    end
    i=1;
    while flag2(i)==1 || flag2(i)==0;
        if i==1 && flag2(i)==1; 
                b2(k)=1;
                k=k+1;
        end

        if flag2(i)==1 && flag2(i+1)==1;
            count2(o)=count2(o)+1;
        end
        if i>1 && flag2(i-1)==1 && flag2(i)==1 && flag2(i+1)==0;
            o=o+1;
        end

        if i>1 && flag2(i+1)==1 && flag2(i)==0;
                b2(k)=i+1;
                k=k+1;
        end
        i=i+1;
        if i>=bg2;
            break;
        end
    end
    dcount2=transpose(count2);
    for i=1:size(dcount2);
        if dcount2(i)>10;
            ncount2=ncount2+1;
        end
    end
    
    
    o=1;
    i=1;
    
    while count2(o)>1;
        if count2(o)<10;
            dcount2(o)=0;
            o=o+1;
        else
            o=o+1;
        end
    end
    
    
    for i=1:bg2;
        ccount2(i)=0;
    end
    tccount=transpose(ccount2);
    o=1;
    for i=1:bg2-1;
        if dcount2(i)~=0;
            tccount2(o)=dcount2(i);
            o=o+1;
        end
    end
    for i=1:bg2-1;
        bk2(i)=0;
    end
    o=1;
    for i=1:bg2-1;
        if count2(i)>10;
            bk2(o)=b2(i);
            o=o+1;
        end
    end
    beginning_of_anticipation2=transpose(bk2);
    
    for i= 1:bg2-3;
        if beginning_of_anticipation2(i)==beginning_of_anticipation2(i+1);
            beginning_of_anticipation2(i+1)=beginning_of_anticipation2(i+2);
        end
    end
    
    %Number of times it has stopped.
    NumOfAnticipation2=ncount2;
    disp('The number of times fly entered the anticipated area:');
    disp(NumOfAnticipation2);
    save((file.name),'NumOfAnticipation2','-append');
    if ncount2>0;
        for i = 1:ncount2;
            ending_of_anticipation2(i)=0;
        end


        o=1;
        for i = 1:ncount2;
            twoD_beginEnd_of_anticipation2(o,i)=0;
            twoD_beginEnd_of_anticipation2(o+1,i)=0;
        end
        for i = 1:ncount2;
            twoD_beginEnd_of_anticipation2(o,i)=beginning_of_anticipation2(i);
            twoD_beginEnd_of_anticipation2(o+1,i)=beginning_of_anticipation2(i)+tccount2(i)-1;
        end



        TranstwoD_beginEnd_of_anticipation2=transpose(twoD_beginEnd_of_anticipation2);
        save((file.name),'TranstwoD_beginEnd_of_anticipation2','-append');
        for i = 1:ncount2;
            twoD_beginEnd_of_anticipation2(o,i)=0;
            twoD_beginEnd_of_anticipation2(o+1,i)=0;
        end

        twoD_beginEnd_of_anticipation2=twoD_beginEnd_of_anticipation2(1:end-(end-1),1:end-(end-1));
    end
end

%-----------------------------part2-done----------------------------------------------------------------

for file = files'
    csv = load(file.name);
    x_alpha3=398.9; %x-coordinate of the anticipated region in the landmark
    y_alpha3=552; %y-coordinate of the anticipated region in the landmark
    p3=size(csv.x_new);
    ncount3=0;
    %formation of array of all the distances.
    for i = 1:p3;
        dist_alpha3(i)=0;
    end
    for i = 1:p3;
        dist_alpha3(i)=sqrt(((csv.x_new(i)-x_alpha3).^2)+((csv.y_new(i)-y_alpha3).^2));
        
    end
    save((file.name),'dist_alpha3','-append');
    
    %formation of an array which can be used for binary purpose.
    for i = 1:p3;
            flag3(i)=0;
    end
    
    %flagging the required part as '1'
    for i = 1:p3;
        if dist_alpha3(i)<50;
            flag3(i)=1;
        else
            continue;
        end
    end
    
    %formation of new array, which can be used to count each '1' sequence.
    for i = 1:(p3);
        count3(i)=1;
    end

    %formation of new array, which can be used to mark the beginning of '1'
    %sequence
    for i = 1:(p3);
        b3(i)=0;
    end
    
    %correct till now.
    
    k=1;
    i=1;
    o=1;
    bg3=0;
    for i=1:p3;
        if flag3(i)==0 || flag3(i)==1;
            bg3=bg3+1;
        end
    end
    %correct till now.
    
    i=1;
    while flag3(i)==1 || flag3(i)==0;
        if i>1 && flag3(i-1)==0 && flag3(i)==1 && flag3(i+1)==0;
            flag3(i)=0;
        end
        i=i+1;
        if i>=bg3;
            break;
        end
    end
    i=1;
    while flag3(i)==1 || flag3(i)==0;
        if i==1 && flag3(i)==1; 
                b3(k)=1;
                k=k+1;
        end

        if flag3(i)==1 && flag3(i+1)==1;
            count3(o)=count3(o)+1;
        end
        if i>1 && flag3(i-1)==1 && flag3(i)==1 && flag3(i+1)==0;
            o=o+1;
        end

        if i>1 && flag3(i+1)==1 && flag3(i)==0;
                b3(k)=i+1;
                k=k+1;
        end
        i=i+1;
        if i>=bg3;
            break;
        end
    end
    dcount3=transpose(count3);
    for i=1:size(dcount3);
        if dcount3(i)>10;
            ncount3=ncount3+1;
        end
    end
    
    
    o=1;
    i=1;
    
    while count3(o)>1;
        if count3(o)<10;
            dcount3(o)=0;
            o=o+1;
        else
            o=o+1;
        end
    end
    
    
    for i=1:bg3;
        ccount3(i)=0;
    end
    tccount=transpose(ccount3);
    o=1;
    for i=1:bg3-1;
        if dcount3(i)~=0;
            tccount3(o)=dcount3(i);
            o=o+1;
        end
    end
    for i=1:bg3-1;
        bk3(i)=0;
    end
    o=1;
    for i=1:bg3-1;
        if count3(i)>10;
            bk3(o)=b3(i);
            o=o+1;
        end
    end
    beginning_of_anticipation3=transpose(bk3);
    
    for i= 1:bg3-3;
        if beginning_of_anticipation3(i)==beginning_of_anticipation3(i+1);
            beginning_of_anticipation3(i+1)=beginning_of_anticipation3(i+2);
        end
    end
    
    %Number of times it has stopped.
    NumOfAnticipation3=ncount3;
    disp('The number of times fly entered the anticipated area:');
    disp(NumOfAnticipation3);
    save((file.name),'NumOfAnticipation3','-append');
    if ncount3>0;
        for i = 1:ncount3;
            ending_of_anticipation3(i)=0;
        end


        o=1;
        for i = 1:ncount3;
            twoD_beginEnd_of_anticipation3(o,i)=0;
            twoD_beginEnd_of_anticipation3(o+1,i)=0;
        end
        for i = 1:ncount3;
            twoD_beginEnd_of_anticipation3(o,i)=beginning_of_anticipation3(i);
            twoD_beginEnd_of_anticipation3(o+1,i)=beginning_of_anticipation3(i)+tccount3(i)-1;
        end



        TranstwoD_beginEnd_of_anticipation3=transpose(twoD_beginEnd_of_anticipation3);
        save((file.name),'TranstwoD_beginEnd_of_anticipation3','-append');
        for i = 1:ncount3;
            twoD_beginEnd_of_anticipation3(o,i)=0;
            twoD_beginEnd_of_anticipation3(o+1,i)=0;
        end

        twoD_beginEnd_of_anticipation3=twoD_beginEnd_of_anticipation3(1:end-(end-1),1:end-(end-1));
    end
end

%-------------------part3-done---------------------------------------------------------------------------

for file = files'
    csv = load(file.name);
    x_alpha4=402; %x-coordinate of the anticipated region in the landmark
    y_alpha4=302.5; %y-coordinate of the anticipated region in the landmark
    p4=size(csv.x_new);
    ncount4=0;
    %formation of array of all the distances.
    for i = 1:p4;
        dist_alpha4(i)=0;
    end
    for i = 1:p4;
        dist_alpha4(i)=sqrt(((csv.x_new(i)-x_alpha4).^2)+((csv.y_new(i)-y_alpha4).^2));
        
    end
    save((file.name),'dist_alpha4','-append');
    
    %formation of an array which can be used for binary purpose.
    for i = 1:p4;
            flag4(i)=0;
    end
    
    %flagging the required part as '1'
    for i = 1:p4;
        if dist_alpha4(i)<50;
            flag4(i)=1;
        else
            continue;
        end
    end
    
    %formation of new array, which can be used to count each '1' sequence.
    for i = 1:(p4);
        count4(i)=1;
    end

    %formation of new array, which can be used to mark the beginning of '1'
    %sequence
    for i = 1:(p4);
        b4(i)=0;
    end
    
    %correct till now.
    
    k=1;
    i=1;
    o=1;
    bg4=0;
    for i=1:p4;
        if flag4(i)==0 || flag4(i)==1;
            bg4=bg4+1;
        end
    end
    %correct till now.
    
    i=1;
    while flag4(i)==1 || flag4(i)==0;
        if i>1 && flag4(i-1)==0 && flag4(i)==1 && flag4(i+1)==0;
            flag4(i)=0;
        end
        i=i+1;
        if i>=bg4;
            break;
        end
    end
    i=1;
    while flag4(i)==1 || flag4(i)==0;
        if i==1 && flag4(i)==1; 
                b4(k)=1;
                k=k+1;
        end

        if flag4(i)==1 && flag4(i+1)==1;
            count4(o)=count4(o)+1;
        end
        if i>1 && flag4(i-1)==1 && flag4(i)==1 && flag4(i+1)==0;
            o=o+1;
        end

        if i>1 && flag4(i+1)==1 && flag4(i)==0;
                b4(k)=i+1;
                k=k+1;
        end
        i=i+1;
        if i>=bg4;
            break;
        end
    end
    dcount4=transpose(count4);
    for i=1:size(dcount4);
        if dcount4(i)>10;
            ncount4=ncount4+1;
        end
    end
    
    
    o=1;
    i=1;
    
    while count4(o)>1;
        if count4(o)<10;
            dcount4(o)=0;
            o=o+1;
        else
            o=o+1;
        end
    end
    
    
    for i=1:bg4;
        ccount4(i)=0;
    end
    tccount4=transpose(ccount4);
    o=1;
    for i=1:bg4-1;
        if dcount4(i)~=0;
            tccount4(o)=dcount4(i);
            o=o+1;
        end
    end
    for i=1:bg4-1;
        bk4(i)=0;
    end
    o=1;
    for i=1:bg4-1;
        if count4(i)>10;
            bk4(o)=b4(i);
            o=o+1;
        end
    end
    beginning_of_anticipation4=transpose(bk4);
    
    for i= 1:bg4-3;
        if beginning_of_anticipation4(i)==beginning_of_anticipation4(i+1);
            beginning_of_anticipation4(i+1)=beginning_of_anticipation4(i+2);
        end
    end
    
    %Number of times it has stopped.
    NumOfAnticipation4=ncount4;
    disp('The number of times fly entered the anticipated area:');
    disp(NumOfAnticipation4);
    save((file.name),'NumOfAnticipation4','-append');
    if ncount4>0;
        for i = 1:ncount4;
            ending_of_anticipation4(i)=0;
        end

    
        o=1;
        for i = 1:ncount4;
            twoD_beginEnd_of_anticipation4(o,i)=0;
            twoD_beginEnd_of_anticipation4(o+1,i)=0;
        end
        for i = 1:ncount4;
            twoD_beginEnd_of_anticipation4(o,i)=beginning_of_anticipation4(i);
            twoD_beginEnd_of_anticipation4(o+1,i)=beginning_of_anticipation4(i)+tccount4(i)-1;
        end



        TranstwoD_beginEnd_of_anticipation4=transpose(twoD_beginEnd_of_anticipation4);
        save((file.name),'TranstwoD_beginEnd_of_anticipation4','-append');
        for i = 1:ncount4;
            twoD_beginEnd_of_anticipation4(o,i)=0;
            twoD_beginEnd_of_anticipation4(o+1,i)=0;
        end

        twoD_beginEnd_of_anticipation4=twoD_beginEnd_of_anticipation4(1:end-(end-1),1:end-(end-1));
    end
end

%----------------------part4-done-------------------------------------------------------------------------

for file = files'
    csv = load(file.name);
    x_alpha5=325; %x-coordinate of the anticipated region in the landmark
    y_alpha5=163.9; %y-coordinate of the anticipated region in the landmark
    p5=size(csv.x_new);
    ncount5=0;
    %formation of array of all the distances.
    for i = 1:p5;
        dist_alpha5(i)=0;
    end
    for i = 1:p5;
        dist_alpha5(i)=sqrt(((csv.x_new(i)-x_alpha5).^2)+((csv.y_new(i)-y_alpha5).^2));
        
    end
    save((file.name),'dist_alpha5','-append');
    
    %formation of an array which can be used for binary purpose.
    for i = 1:p5;
            flag5(i)=0;
    end
    
    %flagging the required part as '1'
    for i = 1:p5;
        if dist_alpha5(i)<50;
            flag5(i)=1;
        else
            continue;
        end
    end
    
    %formation of new array, which can be used to count each '1' sequence.
    for i = 1:(p5);
        count5(i)=1;
    end

    %formation of new array, which can be used to mark the beginning of '1'
    %sequence
    for i = 1:(p5);
        b5(i)=0;
    end
    
    %correct till now.
    
    k=1;
    i=1;
    o=1;
    bg5=0;
    for i=1:p5;
        if flag5(i)==0 || flag5(i)==1;
            bg5=bg5+1;
        end
    end
    %correct till now.
    
    i=1;
    while flag5(i)==1 || flag5(i)==0;
        if i>1 && flag5(i-1)==0 && flag5(i)==1 && flag5(i+1)==0;
            flag5(i)=0;
        end
        i=i+1;
        if i>=bg5;
            break;
        end
    end
    i=1;
    while flag5(i)==1 || flag5(i)==0;
        if i==1 && flag5(i)==1; 
                b5(k)=1;
                k=k+1;
        end

        if flag5(i)==1 && flag5(i+1)==1;
            count5(o)=count5(o)+1;
        end
        if i>1 && flag5(i-1)==1 && flag5(i)==1 && flag5(i+1)==0;
            o=o+1;
        end

        if i>1 && flag5(i+1)==1 && flag5(i)==0;
                b5(k)=i+1;
                k=k+1;
        end
        i=i+1;
        if i>=bg5;
            break;
        end
    end
    dcount5=transpose(count5);
    for i=1:size(dcount5);
        if dcount5(i)>10;
            ncount5=ncount5+1;
        end
    end
    
    
    o=1;
    i=1;
    
    while count5(o)>1;
        if count5(o)<10;
            dcount5(o)=0;
            o=o+1;
        else
            o=o+1;
        end
    end
    
    
    for i=1:bg5;
        ccount5(i)=0;
    end
    tccount5=transpose(ccount5);
    o=1;
    for i=1:bg5-1;
        if dcount5(i)~=0;
            tccount5(o)=dcount5(i);
            o=o+1;
        end
    end
    for i=1:bg5-1;
        bk5(i)=0;
    end
    o=1;
    for i=1:bg5-1;
        if count5(i)>10;
            bk5(o)=b5(i);
            o=o+1;
        end
    end
    beginning_of_anticipation5=transpose(bk5);
    
    for i= 1:bg5-3;
        if beginning_of_anticipation5(i)==beginning_of_anticipation5(i+1);
            beginning_of_anticipation5(i+1)=beginning_of_anticipation5(i+2);
        end
    end
    
    %Number of times it has stopped.
    NumOfAnticipation5=ncount5;
    disp('The number of times fly entered the anticipated area:');
    disp(NumOfAnticipation5);
    save((file.name),'NumOfAnticipation5','-append');
    
    if ncount5>0;
        for i = 1:ncount5;
            ending_of_anticipation5(i)=0;
        end


        o=1;
        for i = 1:ncount5;
            twoD_beginEnd_of_anticipation5(o,i)=0;
            twoD_beginEnd_of_anticipation5(o+1,i)=0;
        end
        for i = 1:ncount5;
            twoD_beginEnd_of_anticipation5(o,i)=beginning_of_anticipation5(i);
            twoD_beginEnd_of_anticipation5(o+1,i)=beginning_of_anticipation5(i)+tccount5(i)-1;
        end



        TranstwoD_beginEnd_of_anticipation5=transpose(twoD_beginEnd_of_anticipation5);
        save((file.name),'TranstwoD_beginEnd_of_anticipation5','-append');
        for i = 1:ncount5;
            twoD_beginEnd_of_anticipation5(o,i)=0;
            twoD_beginEnd_of_anticipation5(o+1,i)=0;
        end
        twoD_beginEnd_of_anticipation5=twoD_beginEnd_of_anticipation5(1:end-(end-1),1:end-(end-1));
    end
end
