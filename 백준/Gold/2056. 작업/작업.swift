let n = Int(readLine()!)!

struct Job {
    var childs = [Int]()
    var indegree = 0
    var duration = 0
}
var jobs = [Job](repeating: Job(), count: n+1)

for i in 1...n {
    let jobInput = readLine()!.split { $0 == " " }.map { Int(String($0))! },
        duration = jobInput[0],
        prevJobs = jobInput[1],
        childJobs = jobInput[2...]
    jobs[i].duration = duration
    jobs[i].indegree = prevJobs

    for jobNumber in childJobs {
        jobs[jobNumber].childs.append(i)
    }
}

func foo() -> Int {
    var queue = [Job]()
    var time = 0
    for i in 1...n {
        if jobs[i].indegree == 0 {
            queue.append(jobs[i])
        }
    }
    var completedJobCount = 0
    while completedJobCount < jobs.count-1 {
        time += 1
        var shouldStartJobs = [Job]()
        for i in 0..<queue.count {
            let job = queue[i]
            if job.duration == 0 {
                completedJobCount += 1
                continue
            }
            let restTime = job.duration - 1
            if restTime == 0 {
                for childJob in job.childs {
                    jobs[childJob].indegree -= 1
                    if jobs[childJob].indegree == 0 {
                        shouldStartJobs.append(jobs[childJob])
                    }
                }
            }
            queue[i].duration -= 1
        }
        queue.append(contentsOf: shouldStartJobs)
        if completedJobCount < jobs.count-1 {
            completedJobCount = 0
        }
    }
    return time
}

let answer = foo() - 1

print(answer)