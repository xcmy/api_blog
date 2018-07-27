## 排序

生成乱序数组


```

s = new Set()
for k in [1..20]
  s.add(Math.ceil(Math.random()*20))

array = Array.from(s)
console.log('原始数组：',array)

```


```
len = array.length - 1
```


### 冒泡

- 比较相邻的元素，如果前一个比后一个大，就把它们两个调换位置。
- 对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。这步做完后，最后的元素会是最大的数。
- 针对所有的元素重复以上的步骤，除了最后一个。
- 持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较。


```

for k in [0..len]
  for i in [0..(len-k)]
    if array[i+1] < array[i]
      [array[i+1],array[i]] = [array[i],array[i+1]]

console.log('冒泡排序结果=>',array)
```


### 选择排序

首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置；然后，再从剩余未排序元素中继续寻找最小（大）元素，放到已排序序列的末尾。以此类推，直到所有元素均排序完毕。


```

for k in [0..len]
  [min,min_index] = [array[k],k]
  [min,min_index] = [array[j],j] for j in [k..len] when min > array[j]
  [array[k],array[min_index]] = [array[min_index],array[k]]

console.log('选择排序结果=>',array)

```

### 二分法查值
用之前排好序的数组查值

```
num = 8

fun =  (num)->
  [start,end] = [0,array.length-1]
  result = -1
  while end - start > 1
    mid = Math.ceil((start+end)/2)
    if num is array[mid]
      result = mid
      break
    else if num > array[mid]
      start = mid
    else
      end = mid
  return result

console.log('-->'+fun(8))
```