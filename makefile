PKG_NAME := Rtemplate
R := /usr/local/bin/R

# Default target: run unit tests
all: test

# Unit test target: run the tests using the testthat package
test:
	@$(R) -e "if (!requireNamespace('testthat', quietly=TRUE)) install.packages('testthat'); testthat::test_dir('tests/testthat')"

# Coverage test target: run the coverage analysis using the covr package
coverage:
	@$(R) -e "if (!requireNamespace('covr', quietly=TRUE)) install.packages('covr'); covr::package_coverage(type = 'tests')"

# Clean target: remove files generated by testing, coverage, etc.
clean:
	@rm -rf .RData .Rhistory .Rproj.user

.PHONY: all test coverage clean