import cohort.UserActivities;

TestUsers(user_id: 1, date: Date(2000, 1, 1));
TestUsers(user_id: 2, date: Date(2000, 2, 1));

TestActivities(user_id: 1, date: Date(2000, 1, 1));
TestActivities(user_id: 1, date: Date(2000, 1, 2));
TestActivities(user_id: 1, date: Date(2000, 2, 1));
TestActivities(user_id: 2, date: Date(2000, 3, 1));
TestActivities(user_id: 2, date: Date(2000, 5, 1));


Test := UserActivities(Users: TestUsers, Activities: TestActivities);
