# coding: utf8
import sys


def nbn(n):
    """
    Logic:
    We must increase digit in minimum possible digit index (from right to left)
    We can encrease it only by digits from right tail
    It is inpossible to increase digits from left part,
    because it make number smaller (smaller digit goes left)
    So we need to start from [-1] index and move down to [0] index,
    Mark this current position index as I.
    At every iteration we must check if bigger digit present in
    tail [I+1,-1] (right part from I index)
    If such digit found we must exchange it with digit at I position
    and sort tail in desc order.

    Proof:
    Where is no smaller digit index to increase
    because we move from left possible index and check it increse possibility.

    Time complexity:
    n - steps to walk from last downto first (worst case)
    n*log(n) - for comparsion sort (can be optimized via radix sort to O(N)
    total: O(n+n*log(n)) time, with radix sort - O(n)!

    SPACE complexity:
    O(N)+O(9) for digit tail_set, so total O(N)
    """

    if not n:
        return 0

    try:
        n = int(n)
    except ValueError:
        return 0
    finally:
        n = list(str(n))

    # str = list(str)
    tail_set = set()
    for i in range(len(n) - 2, -1, -1):
        tail_set.add(n[i + 1])
        found = any(e > n[i] for e in tail_set)
        # print(i, ':', str[i],':',tail_set)
        if found:
            bigger_alts = (e for e in tail_set if e > n[i])
            d = min(bigger_alts)
            # print(d)
            first_match = next(z for z in range(i + 1, len(n)) if n[z] == d)
            # print(first_match, '=', str[first_match])
            n[i], n[first_match] = n[first_match], n[i]
            n[i + 1:len(n)] = sorted(n[i + 1:len(n)])
            return int("".join(n))

    return 0


if __name__ == "__main__":
    try:
        datafile = sys.argv[1]
    except IndexError:
        exit(
            "please specify input file as command line arg (the only),"
            " for example: ./next_biggest_number.py datafile.txt")

    with open(datafile) as f:
        for case in f.readlines():
            print('-----{}'.format(nbn(case)))
