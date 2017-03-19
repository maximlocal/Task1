CC = gcc -std=c11
TARGET = hello
BINARY_NAME = hello
OBJ_DIR = obj
BINARY_DIR = bin
LIBS_DIR = libs
TARGET_OBJ = $(OBJ_DIR)/hello.o
ST1_LIBS_OBJ = $(OBJ_DIR)/libhello.o
ST2_LIBS_OBJ = $(OBJ_DIR)/libgoodbye.o

all : $(TARGET)

$(TARGET) : 
		@make libs
		@make $(TARGET_OBJ)
		@mkdir -p $(BINARY_DIR)
		$(CC) -o $(BINARY_DIR)/$(BINARY_NAME) $(TARGET_OBJ) $(LIBS_DIR)/libgoodbye.a $(LIBS_DIR)/libhello.a 

$(TARGET_OBJ) : $(OBJ_DIR)/%.o : %.c
		$(CC) -c -o $@ $<

libs :
		@mkdir -p $(OBJ_DIR)
		@make $(ST1_LIBS_OBJ)
		@mkdir -p $(LIBS_DIR)
		ar rcs $(LIBS_DIR)/libhello.a $(ST1_LIBS_OBJ)
		@make $(ST2_LIBS_OBJ)
		ar rcs $(LIBS_DIR)/libgoodbye.a $(ST2_LIBS_OBJ)


$(ST1_LIBS_OBJ) : $(OBJ_DIR)/%.o : %.c
		$(CC) -c -o $@ $< 

$(ST2_LIBS_OBJ) : $(OBJ_DIR)/%.o : %.c
		$(CC) -c -o $@ $< 		

clean :
		rm -rf $(OBJ_DIR) $(BINARY_DIR) $(LIBS_DIR)