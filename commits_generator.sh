#! /bin/sh

# The tool for making a specified amount of commits.
# Usage:
# ./commits-generator.sh [new repo basename] [amount of commits]

repo_name=$1
commits_amount=$2

function generator
{
    for i in `seq 0 $commits_amount`
    do
        echo $i >> example_file # Commit number into file.
        git add --all
        git commit -m "Commit number: $i" # Commit message.
    done
}

function main
{
    if type git
    then
        echo "Created repo name:" $repo_name
        mkdir $repo_name
        cd $repo_name
        git init > /dev/null
        echo "Repo initialized."

        touch example_file
        generator $commits_amount
        cat example_file

    else
        echo "Git not found!."
    fi
}

if [ -n $repo_name ] && [ -n $commits_amount ]
then
    main $repo_name

else
    echo "Usage: ./cg.sh [base folder name] [amount of commits]"
fi
