TARGET = hello
TARGET_OBJ = $(OBJ_DIR)/hello.o
OBJ_DIR = obj
BINARY_DIR = bin
BINARY_NAME = hello

all : $(TARGET)

$(TARGET) : 
		mkdir -p $(OBJ_DIR)
		make $(TARGET_OBJ)
		mkdir -p $(BINARY_DIR)
		gcc -o $(BINARY_DIR)/$(BINARY_NAME) $(TARGET_OBJ)

$(TARGET_OBJ) : $(OBJ_DIR)/%.o : %.c
		gcc -c -o $@ $<

clean :
		rm -rf $(OBJ_DIR) $(BINARY_DIR)