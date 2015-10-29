#!/bin/bash
# create_minutes.sh

# Creates meeting minutes boilerplate of the form:
#   ---
#   date: <date>
#   permalink: /about/minutes/<date>/
#   layout: page
#   ---
# and outputs to file <date>.md

function create {
    date="date: $1"
    link="permalink: /about/minutes/$1/"
    layout="layout: page"

    # printf treats leading '---' as -- and expects an argument..
    echo "---" > ./$1.md
    printf "%s\n%s\n%s\n" "$date" "$link" "$layout" >> ./$1.md
    echo "---" >> ./$1.md
    printf "\n###Topic\n* Bullet point" >> ./$1.md

    printf "Created file: ./$1.md\n"
}

function create_from_input_date {
    printf "year (yyyy): "; read year
    printf "month (mm): ";  read month
    printf "day (dd): ";    read day
    create "$year-$month-$day"
}

[ -n "$1" ] && create $1 || create_from_input_date
