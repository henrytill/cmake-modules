#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define _cleanup_(f) __attribute__((cleanup(f)))

#define ARRAY_LENGTH(array) (sizeof(array) / sizeof((array)[0]))

#define ARRAY_PRINT(array, len)        \
  do {                                 \
    printf(#array " = (%p) {", array); \
    printf("%d", (array)[0]);          \
    for (size_t i = 1; i < len; ++i) { \
      printf(", %d", (array)[i]);      \
    }                                  \
    printf("}\n");                     \
  } while (0)

static const int src[] = {0, 1, 2, 3, 4, 5, 6, 7};

static const size_t srclen = ARRAY_LENGTH(src);

static void cleanup(void *p) {
  void *ptr = *(void **)p;   /* void *pp = (void **)p */
  free(ptr);                 /* free(*pp) */
  printf("free(%p)\n", ptr); /* printf("free(%p)\n", *pp) */
}

int main(int argc, char **argv) {
  extern const int src[];
  extern const size_t srclen;

  (void)argc;
  (void)argv;

  const int dstlen = srclen;

  _cleanup_(cleanup) int *dst = calloc(dstlen, sizeof(*dst));
  if (dst == NULL) {
    fprintf(stderr, "calloc failed\n");
    return EXIT_FAILURE;
  }

  ARRAY_PRINT(dst, dstlen);

  memcpy(dst, src, sizeof(src));

  ARRAY_PRINT(dst, dstlen);

  return EXIT_SUCCESS;
}
