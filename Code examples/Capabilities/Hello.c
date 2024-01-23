#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"
#include "signal.h"

int main(){
  pid_t pid = fork();

  if (pid == -1){
    perror("fork failed");
    exit(EXIT_FAILURE);
  }
  else if (pid != 0){
    printf("Parent Process: Before the kill signal\n");
    sleep(2);
    int success = kill(pid, 15);
    if (success){
      printf("We couldn't kill the child\n");
    }
    else{
      printf("The Child is dead\n");
    }
  }
  else {
    while(1){
      printf("Child: Hello World\n");
      sleep(1);
    }
  }
  sleep(5);
  return 0;
}