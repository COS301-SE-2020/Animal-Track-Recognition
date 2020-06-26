import os
import numpy
import PIL
from PIL import Image
cwd = os.getcwd()
print("break "+ 1)
cwd = cwd[:-6]
list1 = os.listdir(cwd + "Training Data/")
out = "charizard"
print("break "+2)
arr = [[]]
out = out + str(arr) + "\n\n"
for i in list1:
    print("break "+3+i)
    wd = cwd + "Training Data\\" + i
    out = out + wd + "\n\t"
    list2 = os.listdir(wd)
    for j in list2:
        print("break "+4+j)
        out = out+"\t" + j + "\t"
        filewd = wd + j
        image = Image.open(filewd)
        out = out + "\t" + image.format + "\t"+ image.mode + "\t"+ image.size + "\t"
        out = out + "\n"
    out = out + "\n"


print(5)


# import glob
# print(glob.glob("../home/adam/*.txt"))
