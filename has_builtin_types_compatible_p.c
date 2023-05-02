#include <stdint.h>
#include <stdlib.h>

typedef uint64_t foo;

_Static_assert(__builtin_types_compatible_p(foo, uint64_t), "foo is not uint64_t");

int main(int argc, char *argv[]) {
  (void)argc;
  (void)argv;
  return EXIT_SUCCESS;
}
