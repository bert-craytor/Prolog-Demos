// Title:     Elevator Route Problem
// Author:    William Bert Craytor
// Date:      August 2013
// Purpose:   Calculate how many different ways you can go down N stories
//            1 or 2 floors at a time.
// Strategy:  Using the tried and true method of mathematical induction,
//            calculate the number of ways to get to two floors above the ground
//            floor and then take that times two alternative methods to descend
//            the remaining two floors (1,1 and 2 or 2 ways), then add to that
//            the number of ways to get to the third floor above the ground floor.
//            Create a function that recurses on the input number of stories.
// Note:      The prolog version displays all of the possible descend routes.

using System;

namespace Elevator
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            string storiesIn;
            int stories = 0;

            var downRoutes = new ElevatorDownRoutes();
            Console.Write("Enter number of stories: ");
            storiesIn = Console.ReadLine();
            Int32.TryParse(storiesIn, out stories);
            if (stories < 1)
            {
                Console.WriteLine("Stories must be greater than 0.");
            }
            else
            {
                Console.WriteLine("{0} stories entered.", stories);
            }
            Console.WriteLine("Alternative routes down {0} floors: {1}", stories, downRoutes.AlternativeWays(stories));
            Console.WriteLine("Press enter to exit.");
            Console.ReadLine();
        }

        /// <summary>
        /// Calculate how many ways you can go down  'stories' stories in an elevator
        /// 1 or 2 stories/floors at a time.
        /// </summary>
        private class ElevatorDownRoutes
        {
            public int AlternativeWays(int stories)
            {
                if (stories < 0)
                    return 0;

                if (stories <= 3)
                {
                    return stories;
                }

                
                return AlternativeWays(stories - 2)*2 + AlternativeWays(stories - 3);
            }
        }
    }
}