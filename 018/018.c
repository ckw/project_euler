#include <stdlib.h>
#include <stdio.h>

//brute force, same as .rb
int max_path(int index, int total, int *global_max, int depth, int tri[], size_t len)
{
  if(index + 1 > len){
    if(total > global_max[0]){
      global_max[0] = total;
    }
    return 0;
  }
  total += tri[index];

  max_path(index + depth, total, global_max, depth + 1, tri, len);
  max_path(index + depth + 1, total, global_max, depth + 1, tri, len);
  return 0;

}

int main(int argc, char **argv)
{

  int global_max[] = {0};
  int tri[] = {
      75, 95, 64, 17, 47, 82, 18, 35, 87, 10, 20, 4, 82, 47, 65, 19, 1, 23, 75
    , 3, 34, 88, 2, 77, 73, 7, 63, 67, 99, 65, 4, 28, 6, 16, 70, 92, 41, 41
    , 26, 56, 83, 40, 80, 70, 33, 41, 48, 72, 33, 47, 32, 37, 16, 94, 29, 53, 71
    , 44, 65, 25, 43, 91, 52, 97, 51, 14, 70, 11, 33, 28, 77, 73, 17, 78, 39, 68
    , 17, 57, 91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48, 63, 66, 4, 68
    , 89, 53, 67, 30, 73, 16, 69, 87, 40, 31, 4, 62, 98, 27, 23, 9, 70, 98, 73
    , 93, 38, 53, 60, 4, 23
  };

  max_path(0, 0, global_max, 1, tri, sizeof(tri) / sizeof(tri[0]));
  printf("max path: %d\n", global_max[0]);

  return 0;
}
