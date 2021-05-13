import cohort.CohortSize;
import cohort.CohortItems;

TestCohortItems(cohort_month: Date(2020, 1, 1), user_id: 1);
TestCohortItems(cohort_month: Date(2020, 1, 1), user_id: 2);

TestCohortItems(cohort_month: Date(2020, 2, 1), user_id: 3);
TestCohortItems(cohort_month: Date(2020, 2, 1), user_id: 4);
TestCohortItems(cohort_month: Date(2020, 2, 1), user_id: 5);

Test := CohortSize(CohortItems: TestCohortItems);
