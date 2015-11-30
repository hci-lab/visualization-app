class smooth
  names=[5,6,1,3,1,1,9,1]

  sum = (input_array...) ->
    total=0;
    for count in input_array
      total+=count
    total


  mean = (input_array...) ->
    (sum input_array...)/input_array.length


  median = (input_array...) ->
    size = input_array.length
    posetion = 0
    result = 0
    if size%2 isnt 0
      posetion = (size-1)/2
      result = input_array[posetion]
    else
      posetion = size / 2
      result = (input_array[posetion]+input_array[posetion-1])/2
    result


  mode = (input_array...) ->
    counter = 1
    max = 0;
    result = input_array[0]

    input_array.sort()

    for i in [1...input_array.length-1]
      if(input_array[i]==input_array[i+1])
        counter++
        if(counter > max)
          max=counter
          result = input_array[i]
        else
          counter = 1

    result


  linear = () ->


  log = ()  ->

  spline = () ->

  density = () ->

  normal = () ->


  kernal =() ->
