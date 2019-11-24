import UIKit

var nums = [1,2,3,4,5,6,7]
var nums2 = [1,2,3,4,5,6,7]
var nums3 = [1,2,3,4,5,6,7]
rotate(&nums, 3)
rotate2(&nums2, 3)
rotate3(&nums3, 3)
print(nums)
print(nums2)
print(nums3)
print("\n\n")

nums = [1, 2]
nums2 = [1, 2]
rotate(&nums, 3)
rotate2(&nums2, 3)
print(nums)
print(nums2)
