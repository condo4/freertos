CFLAGS          += -I$(FREERTOS_DIR)/include 
CPPFLAGS	+= -I$(FREERTOS_DIR)/include 
CFLAGS          += -I$(FREERTOS_DIR)/portable/GCC/ARM_CM4F/ 
CPPFLAGS	+= -I$(FREERTOS_DIR)/portable/GCC/ARM_CM4F/ 
OBJS            += timer.o task.o list.o queue.o
OBJS            += portable/GCC/ARM_CM4F/port.o
