#!/bin/bash

# GLOBALS  NOTE: update every semester
hwrootdir="$HOME/school/utc/grad/s8_2025_fall/"
semester="fall25"

isWardclass="vuln" # NOTE: change to match some substring in the class name

cd $hwrootdir
current=($(fd -t d -d 1)) # get current class dirs

echo "select class..."
i=1
for dir in "${current[@]}"; do
    echo "$i: $dir"
    ((i++))
done
read -e selection

if ! [[ "$selection" =~ ^[0-9]+$ ]] ||
    [ "$selection" -lt 1 ] ||
    [ "$selection" -gt "${#current[@]}" ]; then
    echo "invalid selection..."
    exit
fi

class=$((selection-1)) # display is 1 index; arr is 0 index

hwdir="$hwrootdir${current[class]}assignments/complete"
hwnum=$(( $(ls $hwdir | wc -l) + 1 ))

# init hw name
hwname="hw"
hwname+=$hwnum

# create new dir
mkdir -p $hwdir/$hwname/report/ss
mkdir -p $hwdir/$hwname/src


classname=$(echo "${current[class]}" | cut -d'-' -f1)
fancyclassname=$(echo "$classname" | sed 's/_/\ /g' | tr '[:lower:]' '[:upper:]')
fileclassname=$(echo "$classname" | sed 's/_//g')

if echo "$hwdir" | rg -q "$isWardclass"; then
    # hwfile="$fileclassname.$semester.$hwname.nww612.tex"
    hwfile="$fileclassname.$semester.$hwname.nww612.typ"
    font="Consolas"
else
    # hwfile="peltier_${fileclassname}_${semester}_$hwname.tex"
    hwfile="peltier_${fileclassname}_${semester}_$hwname.typ"
    font="Noto Sans"
fi

# cp in hw tmpl
# cp $HOME/school/hw_tmpl.tex $hwdir/$hwname/report/$hwfile # latex
cp $HOME/school/hw_tmpl.typ $hwdir/$hwname/report/$hwfile # typst
cd $hwdir/$hwname/report

# replace PLACEHOLDERS ( top -> down )
# NOTE: NOT getting date or section name placeholders
sed -i "s/PLACEHOLDER_FONT/$font/g" $hwfile
title="Homework $hwnum"
sed -i "s/PLACEHOLDER_TITLE/$title/g" $hwfile
sed -i "s/PLACEHOLDER_CLASSNAME/$fancyclassname/g" $hwfile

cd $hwdir/$hwname

# cp in gitignore
cat > .gitignore<<EOF
report/ss
*.pdf
*.aux
*.log
*.out
*.zip
EOF

# init git repo
git init
git add .
git commit -am "init commit"


echo ""
echo "$hwfile created in $hwdir/$"
