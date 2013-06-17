#include <stdio.h>

int is_sunday(int day){
  return day % 7 == 0;
}

int days_in_month(int month, int year){
  switch(month % 12){
    case 0: return 31;
    case 1: if(year % 4 == 0){
              if(year % 100 == 0){
                if(year % 400 == 0){
                  return 29;
                }
                return 28;
              }
              return 29;
            }
            return 28;
    case 2: return 31;
    case 3: return 30;
    case 4: return 31;
    case 5: return 30;
    case 6: return 31;
    case 7: return 31;
    case 8: return 30;
    case 9: return 31;
    case 10: return 30;
    case 11: return 31;
  }
  return -1;
}

int p_date(int day, int month, int year){
  char *day_s;
  char *month_s;

  switch(day % 7){
    case 0: day_s = "Sunday"; break;
    case 1: day_s = "Monday"; break;
    case 2: day_s = "Tuesday"; break;
    case 3: day_s = "Wednesday"; break;
    case 4: day_s = "Thursday"; break;
    case 5: day_s = "Friday"; break;
    case 6: day_s = "Saturday"; break;
  }


  switch(month % 12){
    case 0: month_s = "Jan"; break;
    case 1: month_s = "Feb"; break;
    case 2: month_s = "Mar"; break;
    case 3: month_s = "April"; break;
    case 4: month_s = "May"; break;
    case 5: month_s = "June"; break;
    case 6: month_s = "July"; break;
    case 7: month_s = "Aug"; break;
    case 8: month_s = "Sep"; break;
    case 9: month_s = "Oct"; break;
    case 10: month_s = "Nov"; break;
    case 11: month_s = "Dec"; break;
  }

  printf("%s first %d was a %s\n", month_s, year, day_s);
  return 0;
}

int main(int argc, char **argv){
  int day = 2;
  int month = 0;
  int year = 1901;
  int count_sundays = 0;

  while(year < 2001){
    p_date(day, month, year);
    day += days_in_month(month, year);
    count_sundays += is_sunday(day);

    month = (month + 1) % 12;
    if(month == 0){
      year++;
    }
  }

  printf("# of sundays: %d\n", count_sundays);

  return 0;
}
