CFLAGS          += -I$(FREERTOS_DIR)/include/
CFLAGS          += -I$(FREERTOS_DIR)/portable/GCC/ARM_CM4F/
FREEOBJS        += $(FREERTOS_DIR)/portable/GCC/ARM_CM4F/port.o
FREEOBJS        += $(FREERTOS_DIR)/tasks.o
FREEOBJS        += $(FREERTOS_DIR)/list.o
FREEOBJS        += $(FREERTOS_DIR)/queue.o
FREEOBJS        += $(FREERTOS_DIR)/timers.o

#OBJS            += $(BUILD_DIR)/freertos/task.o $(BUILD_DIR)/freertos/list.o $(BUILD_DIR)/freertos/queue.o
#OBJS            += $(BUILD_DIR)/freertos/portable/GCC/ARM_CM4F/port.o

$(FREERTOS_DIR)/%.o: $(FREERTOS_DIR)/%.c
	@printf "  CC\t$<\n"
	@mkdir -p $(dir $@)
	$(Q)$(CC) $(CFLAGS) $(ARCH_FLAGS) -o $@ -c $<


$(FREERTOS_DIR)/libfreertos.a: $(FREEOBJS)
	$(Q)$(AR) rc $(FREERTOS_DIR)/libfreertos.a $(FREEOBJS)
