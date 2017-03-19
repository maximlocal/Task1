CC = gcc -std=c11
TARGET = hello
BINARY_NAME = hello
OBJ_DIR = obj
BINARY_DIR = bin
LIBS_DIR = libs
TARGET_OBJ = $(OBJ_DIR)/hello.o
SH_LIBS_OBJ = $(OBJ_DIR)/libhello.o
ST_LIBS_OBJ = $(OBJ_DIR)/libgoodbye.o

all : $(TARGET)

$(TARGET) : 
		@make libs
		@make $(TARGET_OBJ)
		@mkdir -p $(BINARY_DIR)
		$(CC) -o $(BINARY_DIR)/$(BINARY_NAME) $(TARGET_OBJ) $(LIBS_DIR)/libgoodbye.a -ldl

$(TARGET_OBJ) : $(OBJ_DIR)/%.o : %.c
		$(CC) -c -o $@ $<

libs :
		@mkdir -p $(OBJ_DIR)
		@make $(SH_LIBS_OBJ)
		@mkdir -p $(LIBS_DIR)
		$(CC) -shared -o $(LIBS_DIR)/libhello.so $(SH_LIBS_OBJ) -lc
		@make $(ST_LIBS_OBJ)
		ar rcs $(LIBS_DIR)/libgoodbye.a $(ST_LIBS_OBJ)


$(SH_LIBS_OBJ) : $(OBJ_DIR)/%.o : %.c
		$(CC) -c -fPIC -o $@ $< 

$(ST_LIBS_OBJ) : $(OBJ_DIR)/%.o : %.c
		$(CC) -c -o $@ $< 		

clean :
		rm -rf $(OBJ_DIR) $(BINARY_DIR) $(LIBS_DIR)