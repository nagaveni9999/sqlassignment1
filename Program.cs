using System;
using System.Collections.Generic;

namespace constructorsassign________demo
{
    internal class Program
    {
        static void Main(string[] args)
        {

        }
           class Employee
        {
            private static int counter = 1001;
            public int EmployeeId { get; set; }
            public string Name { get; set; }
            public int Age { get; set; }
            public double Salary { get; set; }
            public List<string> Dependents { get; set; }

            public Employee(string name, int age, double salary)
            {
                this.EmployeeId = counter;
                this.Name = name;
                this.Age = age;
                this.Salary = salary;
                this.Dependents = new List<string>();
                counter++;
            }

            public void AddDependent(string dependentName)
            {
                if (Dependents.Count < 3)
                {
                    Dependents.Add(dependentName);
                }
                else
                {
                    Console.WriteLine("Cannot add more than 3 dependents.");
                }
            }
            public void EditDependent(string dependentName, string newName)
            {
                int index = Dependents.IndexOf(dependentName);
                if (index != -1)
                {
                    Dependents[index] = newName;
                }
                else
                {
                    Console.WriteLine($"Dependent with name '{dependentName}' not found.");
                }
            }
        }

    }
}

