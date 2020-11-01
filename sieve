#!/usr/bin/env ksh

typeset -i max="${1:-1000}"

if ((max <= 0 || $# > 1)); then
    printf 'Usage: %s [max]\n' "$0" >&2
    exit 1
fi

((max < 2)) && exit 0

typeset -a -i sieve

for i in {3..$((int(sqrt(max))))..2}; do
    ((sieve[i])) && continue

    for j in {$((i**2))..$max..$((i * 2))}; do
        sieve[j]=1
    done
done

printf '2\n'
for i in {3..$max..2}; do
    ((sieve[i])) || printf '%d\n' "$i"
done
