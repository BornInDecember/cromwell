task one {
  Int radius
    command {
        echo ${radius*radius}
    }
    output {
        Int rSquared = read_int(stdout())
		Int rCopy = radius
    }
    runtime {
       docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"
    }
}

task two{
   Int r2
   Float pi = 3.14159

   command {
   		echo ${r2*pi}
   }
   output {
		Float area = read_float(stdout())
		Float piCopy = pi
		Int rSquaredCopy = r2
   }
   runtime {
      docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"
   }
}

workflow cacheWithinWF {
   call one {
    input: radius = 62
   }
   call two {
   	input: r2 = one.rSquared
   }
   call two as twoAgain {
   	input: r2 = two.rSquaredCopy
   }
   output {
      two.area
      twoAgain.area
   }
}
