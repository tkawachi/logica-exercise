# ref. https://www.holistics.io/blog/calculate-cohort-retention-analysis-with-sql/
Month() = SqlExpr("MONTH", {});

@OrderBy(CohortItems, "1", "2");
CohortItems(cohort_month:, user_id:) :-
  Users(user_id:, date:),
  cohort_month == DateTrunc(date, Month());

UserActivities(user_id:, month_number:) distinct :-
  Activities(user_id:, date:),
  month_number == DateDiff(date,  cohort_month, Month()),
  cohort_month AnyValue= (x :- CohortItems(cohort_month:x, user_id:));

@OrderBy(CohortSize, "1");
CohortSize(cohort_month:, num_users? += 1) distinct :-
  CohortItems(cohort_month:);

RetentionTable(cohort_month:, month_number:, num_users? += 1) distinct :-
  UserActivities(month_number:, user_id:),
  cohort_month AnyValue= (x :- CohortItems(cohort_month:x, user_id:));

@OrderBy(Cohort, "1", "3");
Cohort(cohort_month:, total_users:, month_number:, percentage:) :-
  RetentionTable(cohort_month:, month_number:, num_users: r_num_users),
  total_users AnyValue= (x :- CohortSize(cohort_month:, num_users: x)),
  percentage == Cast(r_num_users, "FLOAT64") * 100 / total_users,
  !IsNull(cohort_month);
