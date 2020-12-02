task getAverage {
  Int base1 = 9
  Int base2 = 13
    command {
        echo ${(base1*base2)/2}
    }
    output {
        Float average = read_float(stdout())
    }
    runtime {
       docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"
    }
}

task heightProduct{
   Float baseAverage
   Int height = 7

   command {
   		echo ${baseAverage*height}
   }
   output {
		Float trapezoidalArea = read_float(stdout())
   }
   runtime {
      docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"
   }
}

workflow cacheBetweenWF {
   call getAverage {
   }
   call heightProduct {
      input: baseAverage = getAverage.average
   }
   output {
        heightProduct.trapezoidalArea
   }
}
