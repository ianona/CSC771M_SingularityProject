import tkinter as tk
from tkinter import filedialog
import subprocess
import os

abspath = os.path.abspath(__file__)
dname = os.path.dirname(abspath)
os.chdir(dname)
# subprocess.call(["chmod +x lofreq.sh"])

def main(ref,que):
    print("---Pipeling start---")
    print("---Starting sequence alignment---")
    print("WORKIGN DIRECTORY: "+os.getcwd())

    queryFileName = que.split("/")[-1].split(".")[0]
    sortedbam = "sorted"+queryFileName+".bam"

    if choice1 == "1":
        print("Calling Bowtie aligner...")
        subprocess.check_call([os.getcwd()+'/Bowtie/bowtiescript.sh', ref, que])
    elif choice1 == "2":
        print("Calling Last aligner...")
        subprocess.check_call([os.getcwd()+ '/Last/lastscript.sh', ref, que])

    print("---Alignment finished---")
    print("---Starting variant caller---")

    if choice2 == "1":
        print("Calling Lofreq...")
        subprocess.check_call([os.getcwd()+'/Lofreq/lofreq.sh', ref, sortedbam])
    elif choice2 == "2":
        print("Calling VirVarSeq...")

    print("Pipeline finished!")

root = tk.Tk()
root.withdraw()

print("Choose your reference sequence")
root.update()
reference_path = filedialog.askopenfilename(title = "Select reference sequence")
print("Your reference sequence is: " + reference_path)

print("Choose your query sequence")
root.update()
query_path = filedialog.askopenfilename(title = "Select query sequence")
print("Your query sequence is: " + query_path)

print("Choose your sequence aligner")
choice1 = input("Input 1 for Bowtie, 2 for Last\n")
print("Choose your variant caller")
choice2 = input("Input 1 for Lofreq, 2 for VirVarSeq\n")

if (choice1 != "1" and choice1 != "2") or (choice2 != "1" and choice2 != "2"):
    print("Invalid input! Program terminating...")
else:
    main(reference_path,query_path)
