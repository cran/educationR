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

# Engineer_tbl_df data set

library(testthat)

# Test structure and class of Engineer_tbl_df
test_that("Engineer_tbl_df has the expected structure and class", {
  expect_s3_class(Engineer_tbl_df, "tbl_df")  # Verify it is a tibble
  expect_equal(class(Engineer_tbl_df), c("tbl_df", "tbl", "data.frame"))
  expect_equal(length(Engineer_tbl_df), 2)  # It should have 2 columns
  expect_equal(names(Engineer_tbl_df), c("salary", "university"))
})

# Test column types
test_that("Engineer_tbl_df columns have the correct types", {
  expect_type(Engineer_tbl_df$salary, "integer")  # salary should be an integer
  expect_true(is.factor(Engineer_tbl_df$university))  # university should be a factor
})

# Test levels of the factor "university"
test_that("Engineer_tbl_df university column has expected levels", {
  expect_true(length(levels(Engineer_tbl_df$university)) == 3, info = "university should have 3 levels")
})

# Test range and values of "salary" column
test_that("Engineer_tbl_df$salary values are valid", {
  expect_true(all(Engineer_tbl_df$salary >= 0, na.rm = TRUE), info = "salary should be non-negative")
  expect_true(all(!is.na(Engineer_tbl_df$salary)), info = "salary should not have missing values")
})

# Test immutability of Engineer_tbl_df
test_that("Engineer_tbl_df remains unchanged after tests", {
  # Create a deep copy of the original dataset before tests
  original_dataset <- Engineer_tbl_df

  # Perform some example checks
  all(!is.na(Engineer_tbl_df$salary))
  all(levels(Engineer_tbl_df$university) %in% levels(original_dataset$university))

  # Verify the dataset hasn't changed
  expect_identical(original_dataset, Engineer_tbl_df)
  expect_equal(names(original_dataset), names(Engineer_tbl_df))
  expect_equal(length(original_dataset), length(Engineer_tbl_df))
})
