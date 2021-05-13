import cohort.Cohort;

TestUsers(user_id: 1, date: Date(2000, 1, 1));
TestUsers(user_id: 2, date: Date(2000, 1, 2));
TestUsers(user_id: 3, date: Date(2000, 1, 2));
TestUsers(user_id: 4, date: Date(2000, 1, 2));
TestUsers(user_id: 10, date: Date(2000, 2, 1));

TestActivities(user_id: 1, date: Date(2000, 1, 1));
TestActivities(user_id: 1, date: Date(2000, 1, 2));
TestActivities(user_id: 1, date: Date(2000, 2, 1));
TestActivities(user_id: 2, date: Date(2000, 1, 1));
TestActivities(user_id: 2, date: Date(2000, 5, 1));
TestActivities(user_id: 10, date: Date(2000, 2, 1));


Test := Cohort(Users: TestUsers, Activities: TestActivities);
