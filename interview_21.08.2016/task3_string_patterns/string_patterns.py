# coding: utf8
import sys
from itertools import takewhile, dropwhile, combinations

allow = set("abcdefghijklmnopqrstuvwxyz0123456789")


def get_subparts(subseq):
    for istart, iend in (combinations(range(len(subseq)), 2)):
        yield subseq[istart:iend + 1]


def get_subseqs(s):
    chars = (c for c in s)
    while True:
        chars_tail = dropwhile(lambda x: x not in allow, chars)
        subseq = takewhile(lambda x: x in allow, chars_tail)
        subseq = "".join(list(subseq))

        if not subseq:
            break

        if len(subseq) == 1:
            continue

        yield subseq


def find_patterns(s, letters_hash):
    found = set()
    for subseq in get_subseqs(s):
        # print(subseq)
        for smatch in get_subparts(subseq):
            # print("smatch:",smatch)
            first = smatch[0]

            # imperative style
            cnt = 0
            for ind in letters_hash[first]:
                if smatch == s[ind:ind + len(smatch)]:
                    cnt += 1
                if cnt >= 2:
                    # print("smatch:", smatch)
                    found.add(smatch)
                    # yield smatch
                    break

    return found

    # in functional style:
    # cnt = count()
    # def count_till_two(x):
    #     if x:
    #         if cnt.__next__()>1:
    #             return False
    #     return True
    #
    # occurs = len(list(i for i in takewhile(count_till_two, (int(smatch
    # == s[ind:ind+len(smatch)]) for ind in letters_hash[first])) if i))
    # if occurs>=2:
    #     print("smatch:", smatch)


def string_patterns(s):
    """
        find longest subseqs with allowed chars
        generate all posible subparts of subseq (using index combinations)
        check subparts for presenting in str more than twice
        using hash map of start letter

    """
    # print(s)
    letters_hash = {}
    for i, c in enumerate(s):
        letters_hash.setdefault(c, []).append(i)
    # print(letters_hash)

    r = ",".join(sorted((p for p in find_patterns(s, letters_hash)),
                           key=len, reverse=True))
    if not r:
        return 'None'
    return r



# print(string_patterns('a1a1a'))


if __name__ == "__main__":
    try:
        datafile = sys.argv[1]
    except IndexError:
        exit(
            "please specify input file as command line arg (the only),"
            " for example: ./next_biggest_number.py datafile.txt")

    with open(datafile) as f:
        for case in f.readlines():
            print('-----{}'.format(string_patterns(case)))
