CFLAGS          += -I$(FREERTOS_DIR)/include/
CFLAGS          += -I$(FREERTOS_DIR)/portable/GCC/$(FREERTOS_PORT)/

FREEOBJS        += $(FREERTOS_DIR)/portable/GCC/$(FREERTOS_PORT)/port.o
FREEOBJS        += $(FREERTOS_DIR)/portable/MemMang/heap_$(FREERTOS_HEAP).o
FREEOBJS        += $(FREERTOS_DIR)/tasks.o
FREEOBJS        += $(FREERTOS_DIR)/list.o
FREEOBJS        += $(FREERTOS_DIR)/queue.o
FREEOBJS        += $(FREERTOS_DIR)/timers.o

FREERTOS_HEAP   ?= 1

$(FREERTOS_DIR)/%.o: $(FREERTOS_DIR)/%.c
	@printf "  CC\t$<\n"
	@mkdir -p $(dir $@)
	$(Q)$(CC) $(CFLAGS) $(ARCH_FLAGS) -o $@ -c $<

$(FREERTOS_DIR)/libfreertos.a: $(FREEOBJS)
	$(Q)$(AR) rc $(FREERTOS_DIR)/libfreertos.a $(FREEOBJS)
