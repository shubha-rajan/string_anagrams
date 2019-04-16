# A method to check if the two input strings are anagrams of each other
# Returns true if the two input strings are anagrams of each other.
# Returns false otherwise.

# Time complexity: nlog(n) because of 2 separate merge sort calls and one simultaneous iteration through both arrays
# Space complexity: n because of merge sort calls
def string_anagrams(str1, str2)
  return false if !str1 || !str2
  return false if str1.length != str2.length
  str1 = merge_sort(str1)
  str2 = merge_sort(str2)
  i = 0
  while i < str2.length
    return false if str1[i] != str2[i]
    i += 1
  end
  return true
end

def merge_sort(array)
  return array if array.length <= 1

  mid_index = (array.length / 2).floor
  left = merge_sort(array[0...mid_index])
  right = merge_sort(array[mid_index...array.length])
  return merge(left, right)
end

def merge(left, right)
  return right if left.length == 0
  return left if right.length == 0

  if left[0] < right[0]
    return left[0] + merge(left[1..left.length], right)
  else
    return right[0] + merge(left, right[1..right.length])
  end
end
