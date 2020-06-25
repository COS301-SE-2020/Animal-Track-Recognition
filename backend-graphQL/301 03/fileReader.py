import os
cwd = os.getcwd()

cwd=cwd[:-6]
out = os.listdir(cwd+"Training Data/")



print(out)


# import glob
# print(glob.glob("../home/adam/*.txt"))