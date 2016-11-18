length = 12;
fout = open("output.txt", "w")
for dist in range(length):
    validCodes = [];
    validNumbers = [];
    for x in range(1<<length):
        s = ""
        number = x
        for i in range(length):
            if (number%2==0):
                s = "0"+s
            else:
                s = "1"+s
            number = number//2
        valid = True
        for codes in validCodes:
            cnt = 0;
            for i in range(length):
                if (s[i]!=codes[i]):
                    cnt = cnt+1;
            if (cnt<dist+1):
                valid = False
                break;
        if (valid):
            validCodes.append(s)
            validNumbers.append(x);
    #print([dist+1, len(validCodes)])
    if (dist==2):
        i = 0
        mapping = {};
        for number in validNumbers:
            mapping[number] = i;
            i = i+1
        for i in range(1<<length):
            if (not i in validNumbers):
                s = ""
                num = i;
                for j in range(length):
                    if (num%2==0):
                        s = "0"+s
                    else:
                        s = "1"+s
                    num = num//2

                for j in range(len(validNumbers)):
                    cnt = 0
                    for k in range(length):
                        if (validCodes[j][k]!=s[k]):
                            cnt = cnt+1;
                    if cnt==1:
                        mapping[i] = mapping[validNumbers[j]]
                        break
                        
        for i in range(1<<length):
            s = ""
            if not i in mapping:
                num = (1<<8)-1
            else:
                num = mapping[i]
            for j in range(8):
                if (num%2==0):
                    s = "0"+s
                else:
                    s = "1"+s
                num = num//2
            print("assign hamming["+str(i)+"] = 8'b"+s+";", file = fout)
