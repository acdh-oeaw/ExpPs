import glob
import shutil
import os


files = sorted(glob.glob("./xml/*/*.xml"))
other_files = glob.glob("./schema/t*.*")
print(other_files)
all_files = files + other_files
target_dir = "to_ingest"

for x in all_files:
    if x.endswith(".odd"):
        continue
    tail = os.path.split(x)[1]
    target = os.path.join(target_dir, tail)
    shutil.copy(x, target)
