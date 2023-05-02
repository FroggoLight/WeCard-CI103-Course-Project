import datetime

class Task:
    def __init__(self, taskName, userStory, date, description, minutes, startTime, endTime):
        self.taskName = taskName
        self.userStory = userStory
        self.date = date
        self.description = description
        self.minutes = minutes
        self.startTime = startTime
        self.endTime = endTime

    def getName(self):
        return self.taskName 
    def getUserStory(self):
        return self.userStory
    def getDate(self):
        return self.date
    def getDescription(self):
        return self.description
    def getMinutes(self):
        return self.minutes
    def getStartTime(self):
        return self.startTime
    def getEndTime(self):
        return self.endTime

class ActivityReport:
    def __init__(self, startDate, endDate, issues, tasks = []):
        self.startDate = startDate
        self.endDate = endDate
        self.issues = issues
        self.tasks = tasks
    
    def printReport(self):
        print(f"**{startDate} - {endDate}, 2023**\n")
        print(f"Issues: {issues}\n")
        print(f"Activity Report:\n")
        for task in self.tasks:
            print(f"{task.getUserStory()} - {task.getName()} - TO DO \\")
            print(f"{task.getMinutes()} min \\")
            print(f"{task.getDescription()} \\")
            print(f"_{task.getDate()}, 2023, at: {task.getStartTime()} moved to In Progress, {task.getEndTime()} moved to Review._\n")
        print("Signed By: \\\n")
        print("-" * 105)


    def appendTask(self, task):
        self.tasks.append(task)


def addMinutes(time_str, minutes):
    time_obj = datetime.datetime.strptime(time_str, "%I:%M %p")
    new_time_obj = time_obj + datetime.timedelta(minutes=minutes)
    new_time_str = new_time_obj.strftime("%I:%M %p")
    if (new_time_obj.day != time_obj.day):
        new_time_obj += datetime.timedelta(hours=12)
        new_time_str = new_time_obj.strftime("%I:%M %p")
    return new_time_str

def addDays(date_string, days):
    date_object = datetime.datetime.strptime(date_string, '%B %d')
    new_date = date_object + datetime.timedelta(days=days)
    new_date_string = new_date.strftime('%B %d')
    
    return new_date_string

def validTime():
    test = False
    while test == False:
        time = input("What was the time?: ")
        try:
            time2 = addMinutes(time, 1)
            test = True
        except:
            print("Invalid Formatting, Try Again")
            continue
    return time
    
def validMin():
    test = False
    while test == False:
        try:
            num = int(input("How many minutes did it take?: "))
            test = True
        except:
            print("Not an integer, Try Again")
            continue
    return num
        


if __name__ == "__main__":
    startDate = input("Start of the Week (Month Date): ")
    endDate = addDays(startDate, 6)
    issues = input("Any issues to report? (Put 'NONE' if none): ")

    report = ActivityReport(startDate, endDate, issues)

    done = False
    taskNumber = 0

    while done == False:
        taskNumber += 1
        taskName = input(f"What is the name of the task? (#{taskNumber}): ")
        userStory = input("What user story is this task under?: ")
        date = input("What was the date? (Month Date): ")
        startTime = validTime()
        minutes = validMin()
        description = input("Describe what you did.: ")
        endTime = addMinutes(startTime, minutes)

        currentTask = Task(taskName, userStory, date, description, minutes, startTime, endTime)
        report.appendTask(currentTask)

        again = input("Enter another task? (Y/N)")
        if again.upper() == "N":
            done = True

    report.printReport()



