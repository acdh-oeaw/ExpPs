import glob
import shutil
import os


files = sorted(glob.glob("./xml/*/*.xml"))
other_files = glob.glob("./schema/t*.*")
all_files = files + other_files
target_dir = "to_ingest"

for x in all_files:
    if x.endswith(".odd"):
        continue
    tail = os.path.split(x)[1]
    target = os.path.join(target_dir, tail)
    shutil.copy(x, target)

for x in glob.glob(f"{target_dir}/*.xml"):
    with open(x, "r", encoding="utf-8") as fp:
        data = fp.read()# find and replace `../../schema/` with `''`
    data = data.replace("../../schema/", '')
    with open(x, "w", encoding="utf-8") as fp:
        fp.write(data)

