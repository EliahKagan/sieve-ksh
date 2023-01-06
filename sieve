#!/usr/bin/env ksh

# Copyright (c) 2020 Eliah Kagan
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

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
