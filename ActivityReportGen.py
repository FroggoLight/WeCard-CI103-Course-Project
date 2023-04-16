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
        print(f"**{startDate} - {endDate}**\n")
        print(f"Issues: {issues}\n")
        print(f"Activity Report:\n")
        for task in self.tasks:
            print(f"{task.getUserStory()} - {task.getName()} - TO DO \\")
            print(f"{task.getMinutes()} min \\")
            print(f"{task.getDescription()} \\")
            print(f"{task.getDate()}, 2023, at: {task.getStartTime()} moved to In Progress, {task.getEndTime()} moved to Review. \n")
        print("Signed By: \\")

    def appendTask(self, task):
        self.tasks.append(task)

# CHAT GPT's ADD MINUTES FUNCTION :^)
def addMinutes(time_str, minutes):
    # Convert input time to datetime object
    time_obj = datetime.datetime.strptime(time_str, "%I:%M %p")
    # Add minutes to datetime object
    new_time_obj = time_obj + datetime.timedelta(minutes=minutes)
    # Convert new time back to string
    new_time_str = new_time_obj.strftime("%I:%M %p")
    # If new time is on a different day, add 12 hours to get correct AM/PM
    if (new_time_obj.day != time_obj.day):
        new_time_obj += datetime.timedelta(hours=12)
        new_time_str = new_time_obj.strftime("%I:%M %p")
    # Return the new time
    return new_time_str




if __name__ == "__main__":
    startDate = input("Start of the Week (Month Date): ")
    endDate = input("End of the Week (Month Date): ")
    issues = input("Any issues to report? (Put 'NONE' if none): ")

    report = ActivityReport(startDate, endDate, issues)

    done = False
    taskNumber = 0

    while done == False:
        taskNumber += 1
        taskName = input(f"What is the name of the task? (#{taskNumber}): ")
        userStory = input("What user story is this task under?: ")
        date = input("What was the date? (Month Date): ")
        startTime = input("What was the time? (HH:MM AM or PM): ")
        minutes = int(input("How many minutes did it take?: "))
        description = input("Describe what you did.: ")
        endTime = addMinutes(startTime, minutes)

        currentTask = Task(taskName, userStory, date, description, minutes, startTime, endTime)
        report.appendTask(currentTask)

        again = input("Enter another task? (Y/N)")
        if again.upper() == "N":
            done = True

    report.printReport()


