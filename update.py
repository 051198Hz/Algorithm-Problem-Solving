#!/usr/bin/env python

import os
from urllib import parse

HEADER="""# 
# 백준 & 프로그래머스 & SWEA 문제 풀이 목록
[![Solved.ac
프로필](http://mazassumnida.wtf/api/generate_badge?boj=peeper9322)](https://solved.ac/peeper9322)
"""

def main():
    content = ""
    content += HEADER
    
    directories = [];
    solveds = [];

    for root, dirs, files in os.walk("."):
        dirs.sort()
        if root == '.':
            for dir in ('.git', '.github'):
                try:
                    dirs.remove(dir)
                except ValueError:
                    pass
            continue

        category = os.path.basename(root)
        
        if category == 'images':
            continue
        
        directory = os.path.basename(os.path.dirname(root))
        
        if directory == '.':
            continue
            
        if directory not in directories:
            if directory in ["백준", "프로그래머스","goormlevel"]:
                content += "## 📚 {}\n".format(directory)
            elif directory in ["goormlevel"]:
                content += "## 📚 {}\n".format(구름LEVEL)
            else:
                content += "### 🚀 {}\n".format(directory)
                content += "| 문제번호 | 링크 |\n"
                content += "| ----- | ----- |\n"
            directories.append(directory)

        for file in files:
            if category not in solveds:
                content += "|{}|[링크]({})|\n".format(category, parse.quote(os.path.join(root, file)))
                solveds.append(category)
                print("category : " + category)

    with open("README.md", "w") as fd:
        fd.write(content)
        
if __name__ == "__main__":
    main()
