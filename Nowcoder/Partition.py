def partition(data, length, start, end):
    if length <= 0 or start < 0 or end >= length:
        return
    temp = data[start]
    while start < end:
        while start<end and data[end] <= temp:
            end -= 1
        data[start] = data[end]
        while start < end and data[start] >= temp:
            start += 1
        data[end] = data[start]
    data[start]  = temp
    return start
def quickSort(data, length, start, end):
    if start == end:
        return 
    index = partition(data, length, start,end)
    if index > start:
        quickSort(data,length,start, index - 1)
    if index < end:
        quickSort(data, length, index + 1, end)
arr = [1,5,3,9,7]
print quickSort(arr,5,0,4)
print arr


