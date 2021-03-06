# Hey Emacs, this is a -*- makefile -*-
#
# Apogee IMU
#

IMU_APOGEE_CFLAGS  = -DUSE_IMU
IMU_APOGEE_CFLAGS += -DIMU_TYPE_H=\"boards/apogee/imu_apogee.h\"

IMU_APOGEE_SRCS    = $(SRC_SUBSYSTEMS)/imu.c             \
										 $(SRC_BOARD)/imu_apogee.c

IMU_APOGEE_I2C_DEV=i2c1
IMU_APOGEE_CFLAGS += -DUSE_I2C -DUSE_I2C1

IMU_APOGEE_CFLAGS += -DIMU_APOGEE_I2C_DEV=$(IMU_APOGEE_I2C_DEV)
IMU_APOGEE_SRCS += peripherals/mpu60x0.c
IMU_APOGEE_SRCS += peripherals/mpu60x0_i2c.c

ap.CFLAGS += $(IMU_APOGEE_CFLAGS)
ap.srcs   += $(IMU_APOGEE_SRCS)

test_imu.CFLAGS += $(IMU_APOGEE_CFLAGS)
test_imu.srcs   += $(IMU_APOGEE_SRCS)

#
# Simulator
#
include $(CFG_SHARED)/imu_nps.makefile
