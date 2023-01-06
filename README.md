<!-- SPDX-License-Identifier: 0BSD -->

# Sieve of Eratosthenes, in the Korn Shell

`sieve` is a Korn Shell (ksh) script that generates prime numbers up to a
specified bound using a [Sieve of
Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes).

`sieve.rb` is a Ruby script that uses the Ruby standard library to do the same
thing. Its purpose is for checking the correctness of `sieve`'s output.

`test_sieve` is a ksh script that runs both and compares the results. If they
are the same, it prints *OK*. Otherwise, it shows the differences.

## License

[0BSD](https://spdx.org/licenses/0BSD.html). See [**`LICENSE`**](LICENSE).

## Usage

```sh
./sieve [max]
```

For example:

```sh
$ ./sieve 25
2
3
5
7
11
13
17
19
23
```

If no argument is passed, the default is 1000.

`sieve.rb` and `test_sieve` can be called similarly.

## Limitations

### max value

`sieve` is only correct up to 1,052,626:

```sh
$ ./test_sieve 1052626
OK.
```

```sh
$ ./test_sieve 1052627 | wc -l
./sieve: line 18: sieve: subscript out of range
82313
```

### ksh version

`ksh93` is assumed. Other `ksh` might not work. (`ksh93` is the most popular
`ksh` and, most of the time you have a `ksh` command, it's `ksh93`). Not all
systems ship with `ksh`, but you can usually install it through your package
manager; `ksh` and `ksh93` are common package names.
