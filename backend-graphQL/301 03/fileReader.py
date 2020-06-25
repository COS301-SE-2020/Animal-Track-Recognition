import os
cwd = os.getcwd()

cwd = cwd[:-6]
list1 = os.listdir(cwd + "Training Data/")
out = ""

arr=[["Y","X00"],["y","x00"],["y","xz00"]]
out = out+ str(arr) +"\n\n"
for i in list1:
    wd = cwd + "Training Data\\" + i
    out = out + wd + "\n\t"
    list2 = os.listdir(wd)
    for j in list2:
        out = out + j + "\t"
    out = out + "\n"


print(out)


# import glob
# print(glob.glob("../home/adam/*.txt"))
