import 'dart:io';

//create a class for job object
class Job{
  int startTime;
  int endTime;
  int profit;
  Job(this.startTime,this.endTime,this.profit);
}

void main() {

  //result
  int johnEarnings = 0;
  int remainingJobs = 0;
  int otherPeopleEarning=0;

  //Read values input from user
  print("Enter the number of jobs");
  int nOfJobs = int.parse(stdin.readLineSync()!);

  // create a list that will store jobs
  List<Job> jobs = [];


  //loop through total number of jobs prompting user to input starttime endtime and profit for each job
  for(int i=0; i<nOfJobs;i++){
    print("enter start time");
    int startTime = int.parse(stdin.readLineSync()!);

    print("enter end time");
    int endTime = int.parse(stdin.readLineSync()!);

    print("profit");
    int profit = int.parse(stdin.readLineSync()!);  
    
    //add items to list
    jobs.add(Job(startTime,endTime,profit));
  }


  //sort jobs according to its endtime
  jobs.sort((a,b)=>a.endTime.compareTo(b.endTime));

  //Loop through sorted job list and calculate earnings 
  for(int i=0; i< nOfJobs; i++){
    //check if job is first or doesnt overlap with previous and add that to john jobs
    if(i==0||jobs[i].startTime>= jobs[i-1].endTime){
      johnEarnings+=jobs[i].profit;
    }
     
  }

  //calculate earning for other employees
   for(int i=nOfJobs-1; i>=0; i--){
     if(i== nOfJobs-1||  jobs[i].startTime>=(i>0?jobs[i-1].endTime:0)){
       otherPeopleEarning += jobs[i].profit;
       
         // add it to other employees 
         remainingJobs+=1;
       
     }
   }
  

  print("Remaining tasks available for others: $remainingJobs");
  print("Other employee earning: $otherPeopleEarning");
  

}