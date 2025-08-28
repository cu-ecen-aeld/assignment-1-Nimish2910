#include "unity.h"
#include <stdbool.h>
#include <stdlib.h>
#include "../../examples/autotest-validate/autotest-validate.h"
#include "../../assignment-autotest/test/assignment1/username-from-conf-file.h"

/**
* This function should:
*   1) Call the my_username() function in autotest-validate.c to get your hard coded username.
*   2) Obtain the value returned from function malloc_username_from_conf_file() in username-from-conf-file.h within
*       the assignment autotest submodule at assignment-autotest/test/assignment1/
*   3) Use unity assertion TEST_ASSERT_EQUAL_STRING_MESSAGE to verify the two strings are equal.  See
*       the [unity assertion reference](https://github.com/ThrowTheSwitch/Unity/blob/master/docs/UnityAssertionsReference.md)
*/
void test_validate_my_username()
{
    //  Get hardcoded username
    const char *hardcoded = my_username();

    // Then Get username from conf/username.txt
    char *from_conf = malloc_username_from_conf_file();

    // do a sanity check to ensure file read worked
    TEST_ASSERT_NOT_NULL_MESSAGE(from_conf,"malloc_username_from_conf_file() returned NULL. Check conf/username.txt.");

    // now compare both strings
    TEST_ASSERT_EQUAL_STRING_MESSAGE(hardcoded, from_conf,"Username in conf/username.txt does not match my_username().");

    // then free malloc’d string from conf file
    free(from_conf);
}

