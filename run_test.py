#!/usr/bin/env python

import sys
from logica.common import logica_test

def run_test(name, src=None, golden=None, predicate=None,
            user_flags=None):
    """Run one test from this folder with TestManager."""
    src = src or (name + ".l")
    golden = golden or (name + ".txt")
    predicate = predicate or "Test"
    logica_test.TestManager.RunTest(
      name,
      src="test/" + src,
      golden="test/" + golden,
      predicate=predicate,
      user_flags=user_flags)


def run_all():
  """Running all tests."""
  run_test("cohort_items")
  run_test("user_activities")
  run_test("cohort_size")
  run_test("cohort")

if __name__ == '__main__':
  if 'golden_run' in sys.argv:
    logica_test.TestManager.SetGoldenRun(True)

  if 'announce_tests' in sys.argv:
    logica_test.TestManager.SetAnnounceTests(True)

  for a in sys.argv:
    if a.startswith('test_only='):
      logica_test.TestManager.SetRunOnlyTests(a.split('=')[1].split(','))

  logica_test.PrintHeader()
  run_all()
