# educationR - A Comprehensive Collection of Educational Datasets
# Version 0.1.0
# Copyright (C) 2024 Renzo Cáceres Rossi
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# student_sleep_tbl_df data set


library(testthat)

# Test dataset structure and class
test_that("student_sleep_tbl_df loads correctly and has the expected structure", {
  expect_s3_class(student_sleep_tbl_df, "tbl_df")
  expect_equal(nrow(student_sleep_tbl_df), 110)
  expect_equal(ncol(student_sleep_tbl_df), 1)
  expect_equal(names(student_sleep_tbl_df), c("hours"))
})

# Test for correct column types
test_that("student_sleep_tbl_df has correct column type", {
  expect_true(is.numeric(student_sleep_tbl_df$hours),
              info = "The 'hours' column should be a numeric vector")
})

# Test for missing values in the columns
test_that("student_sleep_tbl_df does not have missing values", {
  n_na_hours <- sum(is.na(student_sleep_tbl_df$hours))

  expect_true(n_na_hours == 0, info = paste("Found", n_na_hours, "NA values in 'hours'"))
})

# Test to verify dataset immutability
test_that("student_sleep_tbl_df remains unchanged after tests", {
  # Create a deep copy of the original dataset before tests
  original_dataset <- student_sleep_tbl_df

  # Run some example tests
  sum(is.na(student_sleep_tbl_df$hours))

  # Verify the dataset hasn't changed
  expect_identical(original_dataset, student_sleep_tbl_df)
  expect_equal(nrow(original_dataset), nrow(student_sleep_tbl_df))
  expect_equal(ncol(original_dataset), ncol(student_sleep_tbl_df))
  expect_equal(names(original_dataset), names(student_sleep_tbl_df))
})
