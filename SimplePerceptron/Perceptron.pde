// The activation function
int sign(float n) {
  if (n >= 0) {
    return 1;
  }
  return -1;
}

class Perceptron {
  float[] weights;
  float lr = 0.001; // learning rate

  Perceptron(int n) {
    weights = new float[n];
    // Initialize the weights randomly
    for (int i = 0; i < weights.length; i++) {
      weights[i] = random(-1, 1);
    }
  }

  int guess(float[] inputs) {
    float sum = 0;
    for (int i = 0; i < weights.length; i++) {
      sum += inputs[i] * weights[i];
    }
    return sign(sum);
  }
  
  float guessY(float x) {
   float w0 = weights[0];
   float w1 = weights[1];
   float w2 = weights[2];
   
   return (-w2 - w0 * x) / w1;
  }

  void train(float[] inputs, int target) {
    int guess = guess(inputs);
    int error = target - guess;
    
    // tune all of the weights
    for (int i = 0; i < weights.length; i++) {
       weights[i] += error * inputs[i] * lr; 
    }
  }
}
