def reverse_string(_str):
    return _str[::-1]

def counts_vowels(_str):
    vowels = "aeiouAEIOU"
    count = 0
    for char in _str:
        if char in vowels:
            count+=1
    return count