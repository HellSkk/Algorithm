class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        output = [] 
        for i in range(len(nums)):
            i_val = nums[i]
            for j in range(i + 1,(len(nums))):
                j_val = nums[j]
                if i_val + j_val == target:
                    return [i, j]


        